import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/constant/images.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 1.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      onBoardingBg,
                    ),
                    fit: BoxFit.fitWidth)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onBoardingIllustration,
                      scale: 4,
                    ),
                    GradientText(
                      'Quirkly',
                      style: titleXLTextStyle.copyWith(fontSize: 66),
                      gradientDirection: GradientDirection.ttb,
                      colors: [
                        Colors.white,
                        Color.fromRGBO(229, 255, 127, 1),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "View, create and edit your Task anytime and anywhere",
                        textAlign: TextAlign.center,
                        style: regularTextStyle.copyWith(
                            fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            context.go(AppRoutes.signin);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: textColor),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(34, 38, 19, 1))),
                          onPressed: () {
                            context.go(AppRoutes.signup);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "By getting started you agree with Privacy and Terms",
                    textAlign: TextAlign.center,
                    style: bodyLTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
