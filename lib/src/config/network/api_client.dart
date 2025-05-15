import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:itestified/src/config/network/config.dart';
import 'package:itestified/src/config/service_locators.dart';
import 'package:itestified/src/core/widgets/internet_ch.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/exceptions.dart';
import '../utils/local/auth_local_source.dart';

class ApiClient {
  ApiClient({
    required this.authLocalSource,
  });

  final AuthLocalSource authLocalSource;

  static String baseUrl = AppConfig.baseUrl;

  Future<void> setAuthCookieAndToken(Map<String, String> headers) async {
    final token = await getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Map<String, String>> initializeHeaders() async {
    // final token = await getToken();
    final token = sl<AuthLocalSource>().retrieveAccessToken();
    print("Access token printed $token");
    final presetHeaders = {
      'Accept': '*/*',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return presetHeaders;
  }

  Future<http.Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $uri');
        print('HEADERS: $headers');
      }
      final response = await http.get(
        Uri.parse(uri),
        headers: {...headers, ...?extraHeaders},
      );
      if (kDebugMode) {
        // print('RESPONSE: ${jsonDecode(response.body)}');
        print('URI::: $uri :::: RESPONSE: ${(response.body)}');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        throw ApiException.getException(response);
      }

      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  Future<http.Response> post(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $uri');
        print('HEADERS: $headers');
        print('DATA: $data');
      }

      final response = await http.post(
        Uri.parse(uri),
        headers: {...headers, ...?extraHeaders},
        body: data != null ? jsonEncode(data) : {},
      );

      if (kDebugMode) {
        print('URI: ${uri} STATUS CODE: ${response.statusCode}');
        print('RESPONSE: ${response.body}');
        print('Whats happening?');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        // print('printing response ${response.body}');
        throw ApiException.getException(response);
      }
      return response;
    } catch (e) {
      print(' ---- ${e}');
      throw ApiException.getException(e);
    }
  }

  // we are creating another post method for other responses

  Future<http.Response> postData(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    print('got to api client');
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $url');
        print('HEADERS: $headers');
        print('DATA: $data');
      }
      final token = sl<AuthLocalSource>().retrieveAccessToken();
      print('Token here $token');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          //  'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        //   headers: {...headers, ...?extraHeaders},
        body: data != null ? jsonEncode(data) : {},
      );

      if (kDebugMode) {
        print('URI: ${url} STATUS CODE: ${response.statusCode}');
        print('RESPONSE: ${response.body}');
        print('Whats happening?');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        print('printing response ${response.body}');
        throw ApiException.getOtherException(response);
      }
      return response;
    } catch (e) {
      print(' ---- ${e}');
      //  return http.Response(e.toString(), 500);
      throw ApiException.getOtherException(e);
    }
  }

  Future<http.Response> postDataWithoutContentType(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    print('got to api client');
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $url');
        print('HEADERS: $headers');
        print('DATA: $data');
      }
      final token = sl<AuthLocalSource>().retrieveAccessToken();
      print('Token here $token');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        },
        //   headers: {...headers, ...?extraHeaders},
        body: data != null ? jsonEncode(data) : {},
      );

      if (kDebugMode) {
        print('URI: ${url} STATUS CODE: ${response.statusCode}');
        print('RESPONSE: ${response.body}');
        print('Whats happening?');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        print('printing response ${response.body}');
        throw ApiException.getOtherException(response);
      }
      return response;
    } catch (e) {
      print(' ---- ${e}');
      //  return http.Response(e.toString(), 500);
      throw ApiException.getOtherException(e);
    }
  }

  Future<http.Response> postWithStringResponse(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      if (kDebugMode) {
        print('URL: $uri');
        print('HEADERS: $headers');
        print('DATA: $data');
      }

      final response = await http.post(
        Uri.parse(uri),
        headers: {...headers, ...?extraHeaders},
        body: data != null ? jsonEncode(data) : {},
      );

      if (kDebugMode) {
        print('URI: ${uri} STATUS CODE: ${response.statusCode}');
        print('RESPONSE: ${response.body}');
      }

      // Check if the status code is valid
      if (!_validateStatus(response.statusCode)) {
        throw ApiException.getException(response);
      }
      print('RESPONSE: ${response.body}');
      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  Future<http.Response> put(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      final response = await http.put(
        Uri.parse(uri),
        headers: {...headers, ...?extraHeaders},
        body: jsonEncode(data),
      );

      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  Future<http.Response> patch(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      final response = await http.patch(
        Uri.parse(uri),
        headers: headers,
        body: jsonEncode(data),
      );

      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  Future<http.Response> delete(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final headers = await initializeHeaders();
      await setAuthCookieAndToken(headers);

      final response = await http.delete(
        Uri.parse(uri),
        headers: {...headers},
        body: jsonEncode(data),
      );

      return response;
    } catch (e) {
      throw ApiException.getException(e);
    }
  }

  // Future<http.Response> upload(
  //   String uri, {
  //   List<FormUploadDocument>? files,
  //   Map<String, String>? body,
  //   Map<String, dynamic>? extraHeaders,
  // }) async {
  //   try {
  //     final headers = await initializeHeaders();
  //     await setAuthCookieAndToken(headers);

  //     late List<http.MultipartFile> multipartFiles;

  //     if (files != null && files.isNotEmpty) {
  //       multipartFiles = files.map((uploadDocument) {
  //         return http.MultipartFile(
  //           uploadDocument.field,
  //           http.ByteStream.fromBytes(uploadDocument.file.readAsBytesSync()),
  //           uploadDocument.file.lengthSync(),
  //           filename: uploadDocument.name,
  //           contentType: MediaType.parse(
  //             getMimeType(uploadDocument.file.path),
  //           ),
  //         );
  //       }).toList();
  //     } else {
  //       multipartFiles = [];
  //     }

  //     final request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(uri),
  //     )
  //       ..headers.addAll(headers)
  //       ..fields.addAll(body ?? {})
  //       ..files.addAll(multipartFiles);

  //     final response = await request.send();

  //     return http.Response.fromStream(response);
  //   } catch (e) {
  //     throw ApiException.getException(e);
  //   }
  // }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('token') ?? '';
  }

  // validate the status of a request
  bool _validateStatus(int? status) {
    return status == 200 || status == 201;
  }
}

extension ResponseExtension on http.Response {
  bool get isSuccess {
    final is200 = statusCode == HttpStatus.ok;
    final is201 = statusCode == HttpStatus.created;
    return is200 || is201;
  }
}

class FormUploadDocument {
  const FormUploadDocument({
    required this.field,
    required this.file,
    this.metaData,
  });
  final String field;
  final File file;
  final Map<String, dynamic>? metaData;

  String get name {
    return file.path.split('/').last;
  }

  @override
  String toString() {
    return 'Field: $field || Name: $name || FilePath: ${file.path}';
  }
}

String getMimeType(String path) {
  if (path.contains('.')) {
    final extension = path.split('.').last;
    switch (extension) {
      case 'jpg':
        return 'image/jpeg';
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'ppt':
        return 'application/vnd.ms-powerpoint';
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      default:
        return 'application/octet';
    }
  }
  return 'application/octet-stream';
}
