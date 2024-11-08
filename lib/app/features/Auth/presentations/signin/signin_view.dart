import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Auth/presentations/widgets/auth_textfield.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/auth_illustration.png",
                      scale: 4,
                    ),
                    Text(
                      "Welcome Back",
                      style: titleLTextStyle.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Make it work, make it right, make it fast",
                      style: bodyBaseTextStyle.copyWith(color: Colors.white54),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AuthTextField(
                      hintText: "E-mail",
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      hintText: "Password",
                      prefixIcon: Icons.lock_outline,
                      suffix: Icon(Icons.visibility_off_outlined),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Forgot Password?",
                      style: bodyLTextStyle.copyWith(
                          color: Color.fromRGBO(229, 255, 127, 1)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: textColor),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: bodyLTextStyle.copyWith(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go(AppRoutes.signup);
                          },
                          child: Text(
                            "Sign Up",
                            style: bodyLTextStyle.copyWith(
                                color: Color.fromRGBO(229, 255, 127, 1)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
