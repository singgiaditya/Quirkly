import 'dart:convert';

import 'package:quirckly/app/core/global/entities/user_entity.dart';

class CompanyEntity {
  final String? name;
  final String? description;
  final String? image;
  final UserEntity? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  CompanyEntity({
    this.name,
    this.description,
    this.image,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CompanyEntity.fromRawJson(String str) =>
      CompanyEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdBy: json["created_by"] == null
            ? null
            : UserEntity.fromJson(json["created_by"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
