import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quirckly/app/core/constant/icons.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

class HomeTaskCard extends StatelessWidget {
  const HomeTaskCard({
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
