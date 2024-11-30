import 'dart:convert';

import 'package:quirckly/app/core/global/entities/user_entity.dart';

class LoginResponseModel {
  final String? message;
  final String? token;
  final UserEntity? userEntity;

  LoginResponseModel({
    this.message,
    this.token,
    this.userEntity,
  });

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json["message"],
        token: json["token"],
        userEntity: json["data"] == null ? null : UserEntity.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "data": userEntity?.toJson(),
      };
}


