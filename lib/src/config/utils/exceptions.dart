import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:itestified/src/config/network/error_response.dart';
import 'package:itestified/src/core/utils/app_const/app_strings.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  static ApiException getException(dynamic err) {
    if (err is http.ClientException) {
      return InternetConnectException(err.message);
    }

    if (err is http.Response) {
      try {
        print('This is the error in get Exception ${err.body}');
        return _handleResponseError(err);
      } catch (_) {
        // print('This is another error ${err.body}');
        return OtherExceptions(AppStrings.kDefaultError);
      }
    }

    return OtherExceptions(AppStrings.kDefaultError);
  }

  static ApiException getOtherException(dynamic err) {
    if (err is http.ClientException) {
      return InternetConnectException(err.message);
    }

    if (err is http.Response) {
      print('Error type: ${err.runtimeType}');
      try {
        print('This is the error rrrrrrrrrrrr ${err.body}');
        return _handleErrorResponse(err);
      } catch (_) {
        print('This is another error ${err.body}');
        return OtherExceptions(AppStrings.kDefaultError);
      }
    }

    // print('This is it $err');
    return OtherExceptions(err.message);
  }

  static ApiException _handleErrorResponse(http.Response response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData.containsKey('message')) {
        final dynamic errorData = responseData["message"];

        return OtherExceptions(errorData);
      }
    } catch (_) {
      debugPrint('ENTERED CATCH BLOCK');

      final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      return OtherExceptions(errorResponse.message);
    }

    // Handle status code-based exceptions
    if (response.statusCode == 400) {
      return OtherExceptions(AppStrings.kBadRequestError);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return UnAuthorizedException();
    } else if (response.statusCode == 404 || response.statusCode == 502) {
      return OtherExceptions(AppStrings.kNotFoundError);
    } else if (response.statusCode == 500) {
      return InternalServerException();
    }

    // If none of the above conditions match, return a default exception
    return OtherExceptions(AppStrings.kDefaultError);
  }

  static ApiException _handleResponseError(http.Response response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      //
      //  final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));

      if (responseData.containsKey('message')) {
        final dynamic errorData = responseData['message'];
        print('---- data ----');
        print('---- errror2 $errorData ----');
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('message')) {
          print('---- errror ----');
          return OtherExceptions(errorData['error']);
        }
      }
    } catch (_) {
      debugPrint('ENTERED CATCH BLOCK');
      // If there's an error parsing the JSON or the structure is not as expected, return a default exception
      // return OtherExceptions(AppStrings.kDefaultError);
      // final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      return OtherExceptions(AppStrings.kDefaultError);
    }

    // Handle status code-based exceptions
    if (response.statusCode == 400) {
      return OtherExceptions(AppStrings.kBadRequestError);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return UnAuthorizedException();
    } else if (response.statusCode == 404 || response.statusCode == 502) {
      return OtherExceptions(AppStrings.kNotFoundError);
    } else if (response.statusCode == 500) {
      return InternalServerException();
    }

    // If none of the above conditions match, return a default exception
    return OtherExceptions(AppStrings.kDefaultError);
  }
}

class OtherExceptions implements ApiException {
  OtherExceptions(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class InternetConnectException implements ApiException {
  InternetConnectException(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class InternalServerException implements ApiException {
  @override
  String toString() => message;

  @override
  String get message => AppStrings.kServerError;
}

class UnAuthorizedException implements ApiException {
  @override
  String toString() => message;

  @override
  String get message => AppStrings.kUnAuthorizedError;
}
