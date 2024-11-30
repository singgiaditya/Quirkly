import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/helper/snackbar_helper.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/register_bloc/register_bloc.dart';
import 'package:quirckly/app/features/Auth/presentations/widgets/auth_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SignupView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                    controller: fullNameController,
                    hintText: "Full Name",
                    prefixIcon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    controller: emailController,
                    hintText: "E-mail",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    controller: phoneNumberController,
                    hintText: "Phone Number",
                    prefixIcon: Icons.phone_outlined,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                    suffix: Icon(Icons.visibility_off_outlined),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AuthTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    suffix: Icon(Icons.visibility_off_outlined),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        error: (failure) => SnackbarHelper.showSnackBar(
                            context, failure.message),
                        done: (response) =>
                            context.goNamed(AppRoutes.homeNamed),
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (emailController.text.isEmpty ||
                                      passwordController.text.isEmpty ||
                                      fullNameController.text.isEmpty ||
                                      confirmPasswordController.text.isEmpty ||
                                      phoneNumberController.text.isEmpty) {
                                    SnackbarHelper.showSnackBar(
                                        context, "Please Fill All Fields");
                                    return;
                                  }
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    SnackbarHelper.showSnackBar(context,
                                        "Password not same, please check again");
                                    return;
                                  }

                                  final RegisterRequestModel request =
                                      RegisterRequestModel(
                                          email: emailController.text,
                                          name: fullNameController.text,
                                          password: passwordController.text,
                                          phoneNumber:
                                              phoneNumberController.text);
                                  context
                                      .read<RegisterBloc>()
                                      .add(RegisterEvent.register(request));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: textColor),
                                )),
                          );
                        },
                        loading: () {
                          return SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: null,
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))),
                          );
                        },
                      );
                    },
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
