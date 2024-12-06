import 'package:flutter/material.dart';
import 'package:quirckly/app/core/constant/api.dart';
import 'package:quirckly/app/core/constant/images.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/domain/entities/TeamEntity.dart';

class CardTeam extends StatelessWidget {
  final TeamEntity team;
  const CardTeam({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 24,
            backgroundImage: team.image != null
                ? NetworkImage("${baseUrl}storage/images/${team.image}")
                : AssetImage(noImage)),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${team.name}",
              style: bodyBaseTextStyle.copyWith(color: Colors.white),
            ),
            Text(
              "Company: ${team.company!.name}",
              style: regularTextStyle.copyWith(color: Colors.white60),
            ),
            Text(
              // "Created at: ${company.createdAt!.day}-${company.createdAt!.month}-${company.createdAt!.year}",
              "Created at: ${team.createdAt!.day}-${team.createdAt!.month}-${team.createdAt!.year}",
              style: regularTextStyle.copyWith(color: Colors.white60),
            ),
          ],
        )
      ],
    );
  }
}
