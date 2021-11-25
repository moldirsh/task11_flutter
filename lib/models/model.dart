class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String phone;
  String password;

  LoginRequestModel({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'phone': phone.trim(),
      'password': password.trim(),
    };

    return map;
  }
}