import 'dart:convert';

class LoginResponse {
  final bool success;
  final String message;
  final UserData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  String? id;
  String? email;
  String? fullName;
  String? role;
  String? lastLogin;
  String? createdAt;
  Token token;

  UserData({
    this.id,
    this.email,
    this.fullName,
    this.role,
    this.lastLogin,
    this.createdAt,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      role: json['role'] as String?,
      lastLogin: json['last_login'] as String?,
      createdAt: json['created_at'] as String?,
      token: Token.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'role': role,
      'last_login': lastLogin,
      'created_at': createdAt,
      'token': token.toJson(),
    };
  }
}

class Token {
  String? access;
  String? refresh;

  Token({
    this.access,
    this.refresh,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
    };
  }
}
