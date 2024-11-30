import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quirckly/app/core/constant/icons.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Home/presentations/widgets/home_task_card.dart';
import 'package:quirckly/app/features/Home/presentations/widgets/project_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: bodyBaseTextStyle.copyWith(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Jane Cooper",
                        style: titleXLTextStyle.copyWith(
                          color: greenColor,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(menuIcon)
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Projects",
                    style: titleMTextStyle.copyWith(color: Colors.white),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    transform: Matrix4.translationValues(0, -130, 0),
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: RangeMaintainingScrollPhysics(),
                      cacheExtent: 215,
                      padding: EdgeInsets.only(left: 24, right: 24),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                      itemBuilder: (context, index) {
                        List<Color> color = [
                          pinkColor,
                          greenColor,
                          yellowColor
                        ];
                        return HomeTaskCard(color: color[index]);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    transform: Matrix4.translationValues(0, -130, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Latest Project",
                                style: titleMTextStyle.copyWith(
                                  color: textColor,
                                )),
                            Text(
                              "See All",
                              style: bodyBaseTextStyle.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProjectCard(),
                        SizedBox(
                          height: 20,
                        ),
                        ProjectCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
