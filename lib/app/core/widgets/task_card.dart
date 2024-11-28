import 'package:flutter/material.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  const TaskCard({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Creating Userflow",
                style: bodyBaseTextStyle,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Color(0xFFC9A009),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "In Progress",
                  style: regularTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Front End Develop",
                  style: regularTextStyle.copyWith(color: Colors.white),
                ),
              ),
              Text(
                "Amazon",
                style: regularTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 46,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "14 November 2024",
                style: regularTextStyle,
              ),
              Spacer(),
              Icon(Icons.chat_outlined, color: Colors.black),
              SizedBox(
                width: 8,
              ),
              Text(
                "4",
                style: regularTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
