import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/features/Auth/presentations/onboarding/onboarding_view.dart';
import 'package:quirckly/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.onBoarding,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
