import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirckly/app/core/router/app_router.dart';
import 'package:quirckly/app/core/themes/app_theme.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/login_bloc/login_bloc.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/register_bloc/register_bloc.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/profile_bloc/profile_bloc.dart';
import 'package:quirckly/app/features/Splash/presentations/bloc/splash_cubit.dart';
import 'package:quirckly/app/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => sl()),
        BlocProvider<LoginBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RegisterBloc>(create: (context) => sl()),
        BlocProvider<ProfileBloc>(create: (context) => sl()),
      ],
      child: MaterialApp.router(
        title: "Quirkly",
        theme: appTheme(),
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
