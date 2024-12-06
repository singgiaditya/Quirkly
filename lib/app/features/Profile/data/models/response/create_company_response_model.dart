import 'dart:convert';

class CreateCompanyResponseModel {
  final bool? success;
  final String? message;
  final Data? data;

  CreateCompanyResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory CreateCompanyResponseModel.fromRawJson(String str) =>
      CreateCompanyResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateCompanyResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.image,
    this.description,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
