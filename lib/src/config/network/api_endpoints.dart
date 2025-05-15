import 'package:itestified/src/config/network/config.dart';

const baseUrl = AppConfig.baseUrl;

// AUTH ENDPIONTS
class _AuthEndpoints {
  final String registerUser = '$baseUrl/auth/register';
  final String loginUser = '$baseUrl/auth/login';
  final String forgotPassword = '$baseUrl/auth/password-reset-otp';
  final String createNewPassword = '$baseUrl/auth/reset-password';
  final String verifyOTP = '$baseUrl/auth/verify-otp';
  final String verifyEmail = '$baseUrl/auth/verify-email';
  final String resendEmail = '$baseUrl/auth/resend-email-verification-token';

  final String verifyPwdResetCode = '$baseUrl/auth/verify-password-reset-code';

  final String getOTPOnnEmail = '$baseUrl/auth/request-password-reset-code';
}

// endpoints
final authEndpoints = _AuthEndpoints();


// Todo -> Add more Endpoint classes based on what they do


