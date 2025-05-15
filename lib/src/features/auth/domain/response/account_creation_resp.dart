class AccountCreationResponse {
  final bool? success;
  final String? message;
  final UserData? data;

  AccountCreationResponse({
    this.success,
    this.message,
    this.data,
  });

  factory AccountCreationResponse.fromJson(Map<String, dynamic> json) {
    return AccountCreationResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final User user;
  final Token token;

  UserData({
    required this.user,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      token: Token.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token.toJson(),
    };
  }
}

class User {
  final String? id;
  final String? email;
  final String? fullName;
  final String? createdAt;
  final String? lastLogin;
  String? role;

  User(
      {this.id,
      this.email,
      this.fullName,
      this.createdAt,
      this.lastLogin,
      this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      createdAt: json['created_at'] as String?,
      lastLogin: json['last_login'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'created_at': createdAt,
    };
  }
}

class Token {
  final String access;
  final String refresh;

  Token({
    required this.access,
    required this.refresh,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      access: json['access'] ?? '',
      refresh: json['refresh'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
    };
  }
}
