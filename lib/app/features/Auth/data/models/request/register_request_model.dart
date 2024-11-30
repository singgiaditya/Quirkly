import 'dart:convert';

class RegisterRequestModel {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? password;

  RegisterRequestModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
  });

  factory RegisterRequestModel.fromRawJson(String str) =>
      RegisterRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
      };
}
