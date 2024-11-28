import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/core/widgets/task_card.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

List<Color> color = [pinkColor, greenColor, yellowColor];

int currentColor = 0;

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Project",
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Restful Api",
              style: titleMTextStyle.copyWith(color: pinkColor),
            ),
          ),
          Expanded(
            child: PageView(
              controller: PageController(viewportFraction: 0.85),
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assignment",
                      style: bodyBaseTextStyle.copyWith(color: pinkColor),
                    ),
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 24),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        Color myColor = color[currentColor];
                        currentColor++;
                        if (currentColor > color.length - 1) {
                          currentColor = 0;
                        }
                        return TaskCard(
                          color: myColor,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "In Progress",
                      style: bodyBaseTextStyle.copyWith(color: yellowColor),
                    ),
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 24),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        Color myColor = color[currentColor];
                        currentColor++;
                        if (currentColor > color.length - 1) {
                          currentColor = 0;
                        }
                        return TaskCard(
                          color: myColor,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Completed",
                      style: bodyBaseTextStyle.copyWith(color: greenColor),
                    ),
                    Expanded(
                        child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        Color myColor = color[currentColor];
                        currentColor++;
                        if (currentColor > color.length - 1) {
                          currentColor = 0;
                        }
                        return TaskCard(
                          color: myColor,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
