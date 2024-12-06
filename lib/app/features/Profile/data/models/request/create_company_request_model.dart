import 'dart:convert';
import 'dart:io';

class CreateCompanyRequestModel {
  final String? name;
  final String? description;
  final File? image;

  CreateCompanyRequestModel({
    this.name,
    this.description,
    this.image
  });

  factory CreateCompanyRequestModel.fromRawJson(String str) =>
      CreateCompanyRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCompanyRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateCompanyRequestModel(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
