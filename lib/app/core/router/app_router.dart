import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/features/Auth/presentations/onboarding/onboarding_view.dart';
import 'package:quirckly/app/features/Auth/presentations/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/features/Auth/presentations/signup/signup_view.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.onBoarding,
    routes: [
      //Authentication
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.signin,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupView(),
      ),
    ],
  );
}
