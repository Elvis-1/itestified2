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

abstract class ProfileApi {
  // register user
}

class ProfileApiImpl implements ProfileApi {
  ProfileApiImpl(this.apiClient);
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
}
