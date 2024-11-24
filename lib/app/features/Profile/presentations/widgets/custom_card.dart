import 'package:flutter/material.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

class CustomCard extends StatelessWidget {
  final String? company;
  const CustomCard({super.key, this.company});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage("https://picsum.photos/600")),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amazon",
              style: bodyBaseTextStyle.copyWith(color: Colors.white),
            ),
            company != null
                ? Text(
                    "Company: $company",
                    style: regularTextStyle.copyWith(color: Colors.white60),
                  )
                : SizedBox(),
            Text(
              "Created at: 14 January 2010",
              style: regularTextStyle.copyWith(color: Colors.white60),
            ),
          ],
        )
      ],
    );
  }
}
