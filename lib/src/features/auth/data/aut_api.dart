import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/config/network/api_endpoints.dart';
import 'package:itestified/src/config/network/failures.dart';
import 'package:itestified/src/config/utils/exceptions.dart';
import 'package:itestified/src/features/auth/domain/requests/otp_request.dart';
import 'package:itestified/src/features/auth/domain/requests/register_user_request.dart';
import 'package:itestified/src/features/auth/domain/response/account_creation_resp.dart';
import 'package:itestified/src/features/auth/domain/response/login_response.dart';

abstract class AuthApi {
  // register user
  Future<Either<Failure, AccountCreationResponse>> registerUser(
      RegisterUserRequest registerUserRequest);
  Future<Either<Failure, LoginResponse>> loginUser(
      RegisterUserRequest registerUserRequest);
  Future<Either<Failure, AccountCreationResponse>> forgotPassword(
    RegisterUserRequest registerUserRequest,
  );
  Future<Either<Failure, AccountCreationResponse>> verifyOTP(
    OTPRequest otpRequest,
  );
  Future<Either<Failure, AccountCreationResponse>> setNewPassword(
    RegisterUserRequest registerUserRequest,
  );
}

class AuthApiImpl implements AuthApi {
  AuthApiImpl(this.apiClient);
  ApiClient apiClient;

  @override
  Future<Either<Failure, AccountCreationResponse>> registerUser(
    RegisterUserRequest registerUserRequest,
  ) async {
    try {
      final response = await apiClient.postData(authEndpoints.registerUser,
          data: registerUserRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(
          AccountCreationResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.message));
    }
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> setNewPassword(
    RegisterUserRequest registerUserRequest,
  ) async {
    try {
      final response = await apiClient.postData(authEndpoints.createNewPassword,
          data: registerUserRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(
          AccountCreationResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      return Left(ApiFailure(message: err.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> loginUser(
    RegisterUserRequest registerUserRequest,
  ) async {
    try {
      final response = await apiClient.postData(authEndpoints.loginUser,
          data: registerUserRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(LoginResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      print('This is the error in auth api ${err.message}');
      return Left(ApiFailure(message: err.message));
    }
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> forgotPassword(
    RegisterUserRequest registerUserRequest,
  ) async {
    try {
      final response = await apiClient.postData(authEndpoints.forgotPassword,
          data: registerUserRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(
          AccountCreationResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      print('This is the error auth api $err');
      return Left(ApiFailure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountCreationResponse>> verifyOTP(
    OTPRequest otpRequest,
  ) async {
    try {
      final response = await apiClient.postData(authEndpoints.verifyOTP,
          data: otpRequest.toJson(),
          extraHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return Right(
          AccountCreationResponse.fromJson(json.decode(response.body)));
    } on ApiException catch (err) {
      print('This is the error in auth_api $err');
      return Left(ApiFailure(message: err.toString()));
    }
  }
}
