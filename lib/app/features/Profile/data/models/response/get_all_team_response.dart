import 'dart:convert';

import 'package:quirckly/app/features/Profile/domain/entities/TeamEntity.dart';

class GetAllTeamResponseModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllTeamResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetAllTeamResponseModel.fromRawJson(String str) =>
      GetAllTeamResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllTeamResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllTeamResponseModel(
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
  final int? teamId;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TeamEntity? teams;

  Datum({
    this.id,
    this.userId,
    this.teamId,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.teams,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        teamId: json["team_id"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        teams:
            json["teams"] == null ? null : TeamEntity.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "team_id": teamId,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "teams": teams?.toJson(),
      };
}
