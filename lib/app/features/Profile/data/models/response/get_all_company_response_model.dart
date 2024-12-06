import 'dart:convert';

import 'package:quirckly/app/features/Profile/domain/entities/CompanyEntity.dart';

class GetAllCompanyResponseModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllCompanyResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetAllCompanyResponseModel.fromRawJson(String str) =>
      GetAllCompanyResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllCompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllCompanyResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final int? userId;
  final int? companyId;
  final String? role;
  final DateTime? joinedAt;
  final CompanyEntity? company;

  Datum({
    this.id,
    this.userId,
    this.companyId,
    this.role,
    this.joinedAt,
    this.company,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        companyId: json["company_id"],
        role: json["role"],
        joinedAt: json["joined_at"] == null
            ? null
            : DateTime.parse(json["joined_at"]),
        company: json["company"] == null
            ? null
            : CompanyEntity.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_id": companyId,
        "role": role,
        "joined_at": joinedAt?.toIso8601String(),
        "company": company?.toJson(),
      };
}
