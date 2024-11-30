import 'dart:convert';

import 'package:quirckly/app/core/global/entities/user_entity.dart';

class RegisterResponseModel {
  final String? message;
  final String? token;
  final UserEntity? userEntity;

  RegisterResponseModel({
    this.message,
    this.token,
    this.userEntity,
  });

  factory RegisterResponseModel.fromRawJson(String str) =>
      RegisterResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        message: json["message"],
        token: json["token"],
        userEntity:
            json["data"] == null ? null : UserEntity.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "data": userEntity?.toJson(),
      };
}
