import 'dart:convert';

import 'package:quirckly/app/features/Profile/domain/entities/CompanyEntity.dart';

class TeamEntity {
  final int? id;
  final int? companyId;
  final String? name;
  final dynamic image;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CompanyEntity? company;
  final CreatedBy? createdBy;

  TeamEntity({
    this.id,
    this.companyId,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.company,
    this.createdBy,
  });

  factory TeamEntity.fromRawJson(String str) =>
      TeamEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamEntity.fromJson(Map<String, dynamic> json) => TeamEntity(
        id: json["id"],
        companyId: json["company_id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        company: json["company"] == null
            ? null
            : CompanyEntity.fromJson(json["company"]),
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "name": name,
        "image": image,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "company": company?.toJson(),
        "created_by": createdBy?.toJson(),
      };
}

class CreatedBy {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final dynamic avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CreatedBy({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  factory CreatedBy.fromRawJson(String str) =>
      CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        avatar: json["avatar"],
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
        "email": email,
        "phone_number": phoneNumber,
        "avatar": avatar,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
