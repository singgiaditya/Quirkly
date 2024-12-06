import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/constant/api.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/domain/entities/CompanyEntity.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/card_company.dart';

class DetailCompanyView extends StatelessWidget {
  final CompanyEntity company;
  const DetailCompanyView({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: greenColor,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Company",
                    style: titleSTextStyle.copyWith(color: greenColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(
              thickness: 1,
              color: Color(0xFF3F3849),
            ),
            SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "${baseUrl}storage/images/${company.image}"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${company.name}",
                    style: titleSTextStyle.copyWith(color: greenColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Created by ",
                          style: bodyMTextStyle.copyWith(color: Colors.white),
                          children: [
                        TextSpan(
                            text: "${company.createdBy!.name}",
                            style: bodyMTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))
                      ])),
                  SizedBox(
                    height: 28,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Description: ",
                          style: bodyMTextStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                          children: [
                        TextSpan(
                            style: bodyMTextStyle.copyWith(color: Colors.white),
                            text: "${company.description}")
                      ])),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Team",
                        style: titleSTextStyle.copyWith(color: yellowColor),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Create",
                          style: bodyLTextStyle.copyWith(color: yellowColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => CardCompany(
                      company: CompanyEntity(
                        name: "Amazon",
                        createdAt: DateTime.now(),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
