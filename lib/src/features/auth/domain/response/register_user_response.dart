import 'dart:convert';

class RegisterUserResponse {
  String status;
  String message;

  RegisterUserResponse({required this.message, required this.status});

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}
