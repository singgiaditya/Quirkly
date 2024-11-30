import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Splash/presentations/bloc/splash_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, bool?>(
      bloc: context.read<SplashCubit>()..checkAuthStatus(),
      listener: (context, state) {
        if (state == true) {
          context.goNamed(AppRoutes.homeNamed);
          return;
        }
        if (state == false) {
          context.go(AppRoutes.onBoarding);
        }
      },
      child: Scaffold(
        body: Center(
          child: GradientText(
            'Quirkly',
            style: titleXLTextStyle.copyWith(fontSize: 66),
            gradientDirection: GradientDirection.ttb,
            colors: [
              Colors.white,
              Color.fromRGBO(229, 255, 127, 1),
            ],
          ),
        ),
      ),
    );
  }
}
