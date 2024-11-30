import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/helper/snackbar_helper.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/login_bloc/login_bloc.dart';
import 'package:quirckly/app/features/Auth/presentations/widgets/auth_textfield.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
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
                        style:
                            bodyBaseTextStyle.copyWith(color: Colors.white54),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AuthTextField(
                        controller: emailController,
                        hintText: "E-mail",
                        prefixIcon: Icons.email_outlined,
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
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            done: (response) => context.go(AppRoutes.home),
                            error: (failure) {
                              SnackbarHelper.showSnackBar(
                                  context, failure.message);
                            },
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
                                          passwordController.text.isEmpty) {
                                        SnackbarHelper.showSnackBar(
                                            context, "Please Fill All Fields");
                                        return;
                                      }
                                      final request = LoginRequestModel(
                                          email: emailController.text,
                                          password: passwordController.text);

                                      context.read<LoginBloc>()
                                        ..add(LoginEvent.login(request));
                                    },
                                    child: Text(
                                      "Sign In",
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
      ),
    );
  }
}
