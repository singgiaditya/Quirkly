import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/custom_card.dart';

class ListCompanyView extends StatelessWidget {
  const ListCompanyView({super.key});

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
                    "Your Company",
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
              height: 24,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.pushNamed(AppRoutes.detailTeamNamed),
                  child: CustomCard()),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
