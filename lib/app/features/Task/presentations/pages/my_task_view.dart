import 'package:flutter/material.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/core/widgets/task_card.dart';

class MyTaskView extends StatefulWidget {
  MyTaskView({super.key});

  @override
  _MyTaskViewState createState() => _MyTaskViewState();
}

List<Color> color = [pinkColor, greenColor, yellowColor];

int currentColor = 0;

class _MyTaskViewState extends State<MyTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Task All",
                        style: bodyMTextStyle.copyWith(color: textColor),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Category",
                        style: bodyMTextStyle.copyWith(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                thickness: 2,
                color: Color(0xFF3F3849),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
