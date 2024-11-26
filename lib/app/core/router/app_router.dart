import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/features/Auth/presentations/pages/onboarding_view.dart';
import 'package:quirckly/app/features/Auth/presentations/pages/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/features/Auth/presentations/pages/signup_view.dart';
import 'package:quirckly/app/features/Home/presentations/pages/home_view.dart';
import 'package:quirckly/app/features/NavigationPage/presentations/navigation_page.dart';
import 'package:quirckly/app/features/Profile/presentations/pages/detail_company_view.dart';
import 'package:quirckly/app/features/Profile/presentations/pages/detail_team_view.dart';
import 'package:quirckly/app/features/Profile/presentations/pages/list_company_view.dart';
import 'package:quirckly/app/features/Profile/presentations/pages/list_team_view.dart';
import 'package:quirckly/app/features/Profile/presentations/pages/profile_view.dart';
import 'package:quirckly/app/features/Task/presentations/pages/my_task_view.dart';

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
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.signin,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
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
                    NoTransitionPage(child: MyTaskView()),
              ),
            ]),
            StatefulShellBranch(navigatorKey: _shellNavigatorProfile, routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorProfile,
                path: AppRoutes.profile,
                pageBuilder: (context, state) => NoTransitionPage(
                    child: ProfileView(
                  parentKey: _scaffoldKey,
                )),
                routes: [
                  //company
                  GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRoutes.listCompany,
                      name: AppRoutes.listCompanyNamed,
                      builder: (context, state) => const ListCompanyView(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: AppRoutes.detailCompany,
                          name: AppRoutes.detailCompanyNamed,
                          builder: (context, state) =>
                              const DetailCompanyView(),
                        ),
                      ]),
                  //team
                  GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRoutes.listTeam,
                      name: AppRoutes.listTeamNamed,
                      builder: (context, state) => const ListTeamView(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          path: AppRoutes.detailTeam,
                          name: AppRoutes.detailTeamNamed,
                          builder: (context, state) => const DetailTeamView(),
                        ),
                      ]),
                ],
              ),
            ]),
          ]),
    ],
  );
}
