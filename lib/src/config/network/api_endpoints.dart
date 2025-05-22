import 'package:itestified/src/config/network/config.dart';

const baseUrl = AppConfig.baseUrl;

// AUTH ENDPIONTS
class _AuthEndpoints {
final String registerUser = '$baseUrl/auth/register';
final String loginUser = '$baseUrl/auths/login/password/';
final String forgotPassword = '$baseUrl/auth/password-reset-otp';
final String createNewPassword = '$baseUrl/auth/reset-password';
final String verifyOTP = '$baseUrl/auth/verify-otp';
final String verifyPwdResetCode = '$baseUrl/auth/verify-password-reset-code';
final String getOTPOnnEmail = '$baseUrl/auth/request-password-reset-code';
}


// Todo -> Add more Endpoint classes based on what they do


class _ReviewEndpoints {
  final String submitReview = '$baseUrl/review/reviews/';
}


// endpoints
final authEndpoints = _AuthEndpoints();
final reviewEndpoints = _ReviewEndpoints();
