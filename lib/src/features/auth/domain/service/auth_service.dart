import 'package:dartz/dartz.dart';
import 'package:itestified/src/config/network/failures.dart';
import 'package:itestified/src/features/auth/data/aut_api.dart';
import 'package:itestified/src/features/auth/domain/requests/otp_request.dart';
import 'package:itestified/src/features/auth/domain/requests/register_user_request.dart';
import 'package:itestified/src/features/auth/domain/response/account_creation_resp.dart';
import 'package:itestified/src/features/auth/domain/response/login_response.dart';

abstract class AuthService {
  Future<Either<Failure, AccountCreationResponse>> registerUser(
      RegisterUserRequest registerUserRequest);
  Future<Either<Failure, LoginResponse>> loginUser(
      RegisterUserRequest registerUserRequest);
  Future<Either<Failure, AccountCreationResponse>> forgotPassword(
      RegisterUserRequest registerUserRequest);
  Future<Either<Failure, AccountCreationResponse>> verifyOTP(
      OTPRequest otpRequest);
  Future<Either<Failure, AccountCreationResponse>> verifyEmail(
      OTPRequest otpRequest);
  Future<Either<Failure, AccountCreationResponse>> resendEmail(
      OTPRequest otpRequest);
  Future<Either<Failure, AccountCreationResponse>> setNewPassword(
      RegisterUserRequest registerUserRequest);
}

class AuthServiceImpl implements AuthService {
  AuthApi authApi;
  AuthServiceImpl({required this.authApi});

  @override
  Future<Either<Failure, AccountCreationResponse>> registerUser(
      RegisterUserRequest registerUserRequest) {
    return authApi.registerUser(registerUserRequest);
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> setNewPassword(
      RegisterUserRequest registerUserRequest) {
    return authApi.setNewPassword(registerUserRequest);
  }

  @override
  Future<Either<Failure, LoginResponse>> loginUser(
      RegisterUserRequest registerUserRequest) {
    return authApi.loginUser(registerUserRequest);
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> forgotPassword(
      RegisterUserRequest registerUserRequest) {
    return authApi.forgotPassword(registerUserRequest);
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> verifyOTP(
      OTPRequest otpRequest) {
    return authApi.verifyOTP(otpRequest);
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> verifyEmail(
      OTPRequest otpRequest) {
    return authApi.verifyEmail(otpRequest);
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> resendEmail(
      OTPRequest otpRequest) {
    return authApi.resendEmail(otpRequest);
  }
}
