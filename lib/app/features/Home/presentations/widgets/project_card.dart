import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/constant/icons.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.67,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width / 2.2,
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
                              width: (MediaQuery.sizeOf(context).width / 2.2 -
                                      15) *
                                  0.75,
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
                      onPressed: () {
                        context.pushNamed(AppRoutes.projectNamed);
                      },
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
                constraints: BoxConstraints(maxWidth: 20, maxHeight: 200),
                padding: EdgeInsets.symmetric(vertical: 3),
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
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CircleAvatar(
                              radius: (MediaQuery.sizeOf(context).width / 25),
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius:
                                    (MediaQuery.sizeOf(context).width / 25 - 2),
                                backgroundImage: NetworkImage(
                                    "https://api.dicebear.com/9.x/big-smile/png?seed=Ramadhan&backgroundColor=b6e3f4,c0aede,d1d4f9"),
                              ),
                            );
                          }
                          return Transform(
                            transform: Matrix4.translationValues(
                                0,
                                (-1.0 *
                                        (MediaQuery.sizeOf(context).width /
                                            35)) *
                                    index,
                                0),
                            child: CircleAvatar(
                              radius: (MediaQuery.sizeOf(context).width / 25),
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius:
                                    (MediaQuery.sizeOf(context).width / 25 - 2),
                                backgroundImage: NetworkImage(
                                    "https://api.dicebear.com/9.x/big-smile/png?seed=$index&backgroundColor=b6e3f4,c0aede,d1d4f9"),
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
