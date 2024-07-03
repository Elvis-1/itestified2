import 'package:itestified/src/config/network/config.dart';

final baseUrl = AppConfig.baseUrl;

// AUTH ENDPIONTS
class _AuthEndpoints {
  final String registerUser = '$baseUrl/auth/register';
  final String loginUser = '$baseUrl/auth/login';
  final String verifyPhone = '$baseUrl/auth/verify-code';
  final String resendVerificationCode =
      '$baseUrl/auth/resend-verification-code';

  final String verifyPwdResetCode = '$baseUrl/auth/verify-password-reset-code';
  final String createNewPassword = '$baseUrl/auth/reset-password';

  final String getOTPOnnEmail = '$baseUrl/auth/request-password-reset-code';
}

// endpoints
final authEndpoints = _AuthEndpoints();


// Todo -> Add more Endpoint classes based on what they do


