import 'package:itestified/src/config/network/config.dart';

const baseUrl = AppConfig.baseUrl;

// AUTH ENDPIONTS
class _AuthEndpoints {
  final String registerUser = '$baseUrl/auths/register';
  final String loginUser = '$baseUrl/auths/login/password/';
  final String forgotPassword = '$baseUrl/auths/password-reset-otp';
  final String createNewPassword = '$baseUrl/auths/reset-password';
  final String changePassword = '$baseUrl/auths/dashboard/change_password/';
  final String verifyOTP = '$baseUrl/auths/verify-otp';
  final String verifyEmail = '$baseUrl/auths/verify-email';
  final String resendEmail = '$baseUrl/auths/resend-email-verification-token';

  final String verifyPwdResetCode = '$baseUrl/auths/verify-password-reset-code';

  final String getOTPOnnEmail = '$baseUrl/auths/request-password-reset-code';
  final String getAllUsers = '$baseUrl/auths/users/all/';
  final String deleteAccount = '$baseUrl/auths/users/delete/';
}

// endpoints
final authEndpoints = _AuthEndpoints();


// Todo -> Add more Endpoint classes based on what they do


