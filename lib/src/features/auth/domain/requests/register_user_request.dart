class RegisterUserRequest {
  String? email;
  String? fullName;
  String? password;
  String? password2;

  RegisterUserRequest(
      {this.email, this.fullName, this.password, this.password2});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'full_name': fullName,
      'password': password,
      'password2': password2
    };
  }
}
