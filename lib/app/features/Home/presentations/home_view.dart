import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quirckly/app/core/constant/icons.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

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
                        return TaskCard(color: color[index]);
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

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(24)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Creating Userflow",
                  style: titleSTextStyle.copyWith(color: greenColor),
                ),
                Text(
                  "Front End Develop",
                  style: bodyBaseTextStyle.copyWith(color: Colors.white60),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Container(
                      width: 174,
                      height: 16,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffe5ff7f), Color(0xffd9d9d9)],
                            stops: [0.15, 0.85],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 156 * 0.75,
                          ),
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 218, 25, 1),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        -2, 0), // changes position of shadow
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "75%",
                      style: bodyBaseTextStyle.copyWith(color: greenColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(yellowColor),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Open Project",
                            style: bodyBaseTextStyle.copyWith(color: textColor),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset(
                            nextIcon,
                            color: textColor,
                            height: 12,
                          )
                        ],
                      )),
                ),
              ],
            ),
            Spacer(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "https://xsgames.co/randomusers/avatar.php?g=male"),
                              ),
                            );
                          }
                          return Transform(
                            transform:
                                Matrix4.translationValues(0, -10.0 * index, 0),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "https://xsgames.co/randomusers/avatar.php?g=male"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: yellowColor,
                      child: Text(
                        "3+",
                        style: bodyMTextStyle.copyWith(color: textColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 215,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              style: titleSTextStyle.copyWith(color: textColor, fontSize: 28),
              TextSpan(
                text: "Product",
                children: [
                  TextSpan(
                      text: " Design",
                      style: bodyBaseTextStyle.copyWith(
                        fontSize: 28,
                        color: textColor,
                      )),
                ],
              ),
            ),
            Text(
              "23 Task",
              style: bodyBaseTextStyle.copyWith(fontSize: 18, color: textColor),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "More Info",
                  style: bodyBaseTextStyle.copyWith(
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: SvgPicture.asset(nextIcon)),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
