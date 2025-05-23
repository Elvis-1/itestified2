class OTPRequest {
  final String? email;
  final String? otp;

  OTPRequest({this.email, this.otp});

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}
