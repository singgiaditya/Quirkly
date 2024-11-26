import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/custom_card.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/show_custom_bottom_sheet.dart';

class ProfileView extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentKey;
  const ProfileView({super.key, required this.parentKey});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Account",
            style: titleMTextStyle.copyWith(color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () =>
                  showCustomBottomSheet(widget.parentKey.currentContext!),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://api.dicebear.com/9.x/big-smile/png?seed=Ramadhan&backgroundColor=b6e3f4,c0aede,d1d4f9"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Company",
                    style: titleSTextStyle.copyWith(color: greenColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.listCompanyNamed);
                    },
                    child: Text(
                      "See All",
                      style: bodyLTextStyle.copyWith(color: greenColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => CustomCard(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 14,
                ),
              ),
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
                  Text(
                    "See All",
                    style: bodyLTextStyle.copyWith(color: yellowColor),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => CustomCard(company: "Amazon"),
                separatorBuilder: (context, index) => SizedBox(
                  height: 14,
                ),
              )
            ],
          ),
        )));
  }
}
