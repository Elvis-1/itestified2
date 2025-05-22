import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itestified/src/config/service_locators.dart';
import 'package:itestified/src/config/utils/local/auth_local_source.dart';
import 'package:itestified/src/core/utils/app_const/enum.dart';
import 'package:itestified/src/core/utils/input_validator.dart';
import 'package:itestified/src/core/widgets/common_popup.dart';
import 'package:itestified/src/core/widgets/custom_snack.dart';
import 'package:itestified/src/features/auth/domain/requests/otp_request.dart';
import 'package:itestified/src/features/auth/domain/requests/register_user_request.dart';
import 'package:itestified/src/features/auth/domain/service/auth_service.dart';
import 'package:itestified/src/features/auth/presentation/screens/login_screen.dart';
import 'package:itestified/src/features/auth/presentation/screens/new_password.dart';
import 'package:itestified/src/features/auth/presentation/screens/verify_email_screen.dart'
    as verify_email;
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart'
    as otp_screen;
import 'package:itestified/src/features/nav/navbar.dart';

class AuthViewModel with ChangeNotifier {
  AuthService authService;
  final AuthLocalSource _authLocalSource = sl<AuthLocalSource>();

  AuthViewModel(this.authService);

  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  bool _isGuest = false;
  bool get isGuest => _isGuest;
  bool _passwordCreatedSuccessfully = false;
  bool get passwordCreatedSuccessfully => _passwordCreatedSuccessfully;

  bool hasErrors = false;
  String? emailError;
  String? nameError;
  String? passwordErr;
  String? confirmPassErr;

  int seconddsRemainingForResetPass = 300;

  Timer? _timer;

  void setGuestMode(bool isGuest) {
    _isGuest = isGuest;
    notifyListeners();
  }

  void setPasswordCreatedSuccessfully(bool value) {
    _passwordCreatedSuccessfully = value;
    notifyListeners();
  }

  validateFields(String? name, String? email, String pass, String confirmP,
      {UseType useType = UseType.SignUP, bool isForgotPasswordScreen = false}) {
    nameError = Validators.validateName(name);
    emailError = Validators.validateEmail(email);
    passwordErr = Validators.validatePassword(pass);
    confirmPassErr = Validators.validateConfirmPassword(pass, confirmP);

    hasErrors = getType(useType);
    notifyListeners();
  }

  bool showPassword = false;
  showOrHidePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void initializeTimer() {
    _timer?.cancel();

    startTimer();
  }

  startTimer() {
    seconddsRemainingForResetPass = 300;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconddsRemainingForResetPass > 0) {
        seconddsRemainingForResetPass--;
      } else {
        _timer?.cancel();
      }

      notifyListeners();
    });
  }

  resetTimer() {
    startTimer();
  }

  bool getType(UseType useType) {
    switch (useType) {
      case UseType.LogIn:
        return (emailError != null || passwordErr != null);
      case UseType.ForgotPassword:
        return emailError != null;
      case UseType.CreateNewPassword:
        return (passwordErr != null || confirmPassErr != null);
      default:
        return (nameError != null ||
            emailError != null ||
            passwordErr != null ||
            confirmPassErr != null);
    }
  }

  _clearFields() {
    fullNameController.clear();
    emailController.clear();

    passwordController.clear();

    confirmPasswordController.clear();
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.mulish(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    var email = emailController.text.trim();
    var fullName = fullNameController.text.trim();
    var password = passwordController.text.trim();
    var passwordConfirm = confirmPasswordController.text.trim();

    if (hasErrors) return;

    print(
        'fullname $fullName and  email $email, password: $password and password confirm: $passwordConfirm');

    RegisterUserRequest userRequest = RegisterUserRequest(
        email: email,
        fullName: fullName,
        password: password,
        password2: passwordConfirm);

    print(
        '${userRequest.email},${userRequest.fullName}, ${userRequest.password},${userRequest.email}');

    CommonPopup.showLoading(context);
    var response = await authService.registerUser(userRequest);
    CommonPopup.closeLoading(context);

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
    }, (success) async {
      _clearFields();

      if (context.mounted) {
        customSnack(context, success.message ?? '');
        Navigator.pushNamed(context, verify_email.VerifyEmailScreen.routeName,
            arguments: verify_email.Arguments(email: email));
      }
    });
  }

  Future<void> setNewPassword(BuildContext context, String userEmail,
      {bool showSuccessMessage = false}) async {
    var email = userEmail;

    var password = passwordController.text.trim();
    var passwordConfirm = confirmPasswordController.text.trim();

    if (hasErrors) return;

    RegisterUserRequest userRequest = RegisterUserRequest(
        email: email, password: password, password2: passwordConfirm);

    print(
        '${userRequest.email}${userRequest.fullName} ${userRequest.password}${userRequest.email}');

    CommonPopup.showLoading(context);
    var response = await authService.setNewPassword(userRequest);
    CommonPopup.closeLoading(context);

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
    }, (success) async {
      // Set success state if requested
      if (showSuccessMessage) {
        setPasswordCreatedSuccessfully(true);
      }

      _clearFields();
      customSnack(context, success.message ?? '');

      // Delay navigation to allow users to see the success message
      if (showSuccessMessage) {
        await Future.delayed(const Duration(seconds: 3));
      }

      if (context.mounted) {
        Navigator.pushNamed(context, NavBar.routeName);
      }
    });
  }

  Future<void> loginUser(BuildContext context) async {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if (hasErrors) return;

    print('email $email, password: $password');

    RegisterUserRequest userRequest = RegisterUserRequest(
      email: email,
      password: password,
    );
    print('User Request: ${userRequest.email}, ${userRequest.password}');

    setGuestMode(false);

    CommonPopup.showLoading(context);
    var response = await authService.loginUser(userRequest);
    CommonPopup.closeLoading(context);

    response.fold(
      (failure) {
        _showSnackBar(context, failure.message, Colors.red);
      },
      (success) async {
        try {
          // Log LoginResponse for debugging
          print(
              'LoginResponse: success=${success.success}, message=${success.message}');

          // Extract tokens from success.data.token
          final accessToken = success.data.token.access;
          final refreshToken = success.data.token.refresh;

          if (accessToken == null || refreshToken == null) {
            throw Exception('Access or refresh token is null');
          }

          print('Access Token: $accessToken');
          print('Refresh Token: $refreshToken');

          // Save tokens
          await _authLocalSource.storeAccesskey(accessToken);
          await _authLocalSource.saveString('refresh_token', refreshToken);

          _clearFields();

          if (context.mounted) {
            Navigator.pushNamed(context, NavBar.routeName);
          }
        } catch (e) {
          print('Error processing LoginResponse: $e');
          _showSnackBar(
              context, 'Error processing login response: $e', Colors.red);
        }
      },
    );
  }

  Future<void> forgotPassword(BuildContext context) async {
    var email = emailController.text.trim();

    if (hasErrors) return;

    RegisterUserRequest userRequest = RegisterUserRequest(
      email: email,
    );

    CommonPopup.showLoading(context);
    var response = await authService.forgotPassword(userRequest);
    CommonPopup.closeLoading(context);

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
      print("****** failure: $failure");
    }, (success) async {
      customSnack(context, success.message ?? "");
      Navigator.pushNamed(context, otp_screen.OTPScreen.routeName,
          arguments: otp_screen.Arguments(email: email));
      if (context.mounted) {
        Navigator.pushNamed(context, otp_screen.OTPScreen.routeName,
            arguments: otp_screen.Arguments(email: email));
      }
    });
  }

//this method Verify email supplied by the user by sending the otp to the email
  Future<void> verifyEmail(BuildContext context, String userEmail) async {
    var email = userEmail;

    String otp = otpControllers.map((controller) => controller.text).join();
    if (otp.isEmpty || otp.length < otpControllers.length) {
      _showSnackBar(context, 'OTP can\'t  be empty', Colors.red);
      return;
    }
    if (hasErrors) return;

    print('This is otp $otp');

    OTPRequest otpRequest = OTPRequest(email: email, otp: otp);

    CommonPopup.showLoading(context);
    var response = await authService.verifyEmail(otpRequest);
    if (context.mounted) {
      CommonPopup.closeLoading(context);
    }

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
    }, (success) async {
      _clearFields();
      customSnack(context, success.message ?? '');

      if (context.mounted) {
        Navigator.pushNamed(
          context, NavBar.routeName,
          // arguments: NavBarArguments(
          //     index: 0, email: email, isFromVerifyEmail: true)
        );
      }
    });
  }

  //this method resend otp to the email supplied
  Future<void> resendEmail(BuildContext context, String userEmail) async {
    var email = userEmail;

    // String otp = otpControllers.map((controller) => controller.text).join();
    // if (otp.isEmpty || otp.length < otpControllers.length) {
    //   _showSnackBar(context, 'OTP can\'t  be empty', Colors.red);
    //   return;
    // }
    // if (hasErrors) return;

    // print('This is otp $otp');

    OTPRequest otpRequest = OTPRequest(
      email: email,
    );

    CommonPopup.showLoading(context);
    var response = await authService.resendEmail(otpRequest);
    if (context.mounted) {
      CommonPopup.closeLoading(context);
    }

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
    }, (success) async {
      _clearFields();
      customSnack(context, success.message ?? '');

      if (context.mounted) {
        Navigator.pushNamed(
          context,
          LoginScreen.routeName,
        );
      }
    });
  }

  Future<void> verifyOTP(BuildContext context, String userEmail) async {
    var email = userEmail;

    String otp = otpControllers.map((controller) => controller.text).join();
    if (otp.isEmpty || otp.length < otpControllers.length) {
      _showSnackBar(context, 'OTP can\'t  be empty', Colors.red);
      return;
    }
    if (hasErrors) return;

    print('This is otp $otp');

    OTPRequest otpRequest = OTPRequest(email: email, otp: otp);

    CommonPopup.showLoading(context);
    var response = await authService.verifyOTP(otpRequest);
    CommonPopup.closeLoading(context);

    response.fold((failure) {
      _showSnackBar(context, failure.message, Colors.red);
    }, (success) async {
      _clearFields();
      customSnack(context, success.message ?? '');

      if (context.mounted) {
        Navigator.pushNamed(context, NewPasswordScreen.routeName,
            arguments: otp_screen.Arguments(email: email));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}
