import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Auth/presentations/widgets/auth_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/images/auth_illustration.png",
                    scale: 4,
                  ),
                  Text(
                    "Get On Board!",
                    style: titleLTextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Create your profile to start your \nJourney.",
                    style: bodyBaseTextStyle.copyWith(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    hintText: "Full Name",
                    prefixIcon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    hintText: "E-mail",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    hintText: "Phone Number",
                    prefixIcon: Icons.phone_outlined,
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
                    height: 12,
                  ),
                  AuthTextField(
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    suffix: Icon(Icons.visibility_off_outlined),
                  ),
                  SizedBox(
                    height: 40,
                  ),
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
                        "Already have an account? ",
                        style: bodyLTextStyle.copyWith(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRoutes.signin);
                        },
                        child: Text(
                          "Sign In",
                          style: bodyLTextStyle.copyWith(
                              color: Color.fromRGBO(229, 255, 127, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
