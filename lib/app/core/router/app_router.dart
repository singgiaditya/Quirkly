import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/features/Auth/presentations/onboarding/onboarding_view.dart';
import 'package:quirckly/app/features/Auth/presentations/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/features/Auth/presentations/signup/signup_view.dart';
import 'package:quirckly/app/features/Home/presentations/home_view.dart';
import 'package:quirckly/app/features/NavigationPage/presentations/navigation_page.dart';

class AppRouter {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  // News
  static final _shellNavigatorTask = GlobalKey<NavigatorState>(
    debugLabel: 'Task',
  );

  // Notifications
  static final _shellNavigatorProfile = GlobalKey<NavigatorState>(
    debugLabel: 'Profile',
  );

  // Settings

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
      //Main Page
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => NavigationPage(
              navigationShell: navigationShell, scaffoldKey: _scaffoldKey),
          branches: [
            StatefulShellBranch(navigatorKey: _shellNavigatorHome, routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorHome,
                path: AppRoutes.home,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: HomeView()),
              ),
            ]),
            StatefulShellBranch(navigatorKey: _shellNavigatorTask, routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorTask,
                path: AppRoutes.task,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: Text("My Task")),
              ),
            ]),
            StatefulShellBranch(navigatorKey: _shellNavigatorProfile, routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorProfile,
                path: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: Text("Profile")),
              ),
            ]),
          ])
    ],
  );
}
