import 'package:flutter/material.dart';
import 'package:quirckly/app/core/constant/api.dart';
import 'package:quirckly/app/core/constant/images.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/domain/entities/CompanyEntity.dart';

class CardCompany extends StatelessWidget {
  final CompanyEntity company;
  const CardCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 24,
            backgroundImage: company.image != null
                ? NetworkImage("${baseUrl}storage/images/${company.image}")
                : AssetImage(noImage)),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${company.name}",
              style: bodyBaseTextStyle.copyWith(color: Colors.white),
            ),
            Text(
              "Created at: ${company.createdAt!.day}-${company.createdAt!.month}-${company.createdAt!.year}",
              style: regularTextStyle.copyWith(color: Colors.white60),
            ),
          ],
        )
      ],
    );
  }
}
