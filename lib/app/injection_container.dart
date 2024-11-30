import 'package:get_it/get_it.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:quirckly/app/features/Auth/data/repository/auth_repository_impl.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/get_local_token_usecase.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/login_usecase.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/logout_usecase.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/register_usecase.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/login_bloc/login_bloc.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/register_bloc/register_bloc.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/get_local_user_usecase.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/profile_bloc/profile_bloc.dart';
import 'package:quirckly/app/features/Splash/presentations/bloc/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //shared pref
  sl.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  // Wait for SharedPreferences to be ready
  await sl.allReady();

  //http client
  sl.registerLazySingleton<http.Client>(() => http.Client());

  //data source
  sl.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSource(sl()),
  );

  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSource(sl()),
  );

  //repository impl
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  //use case

  //auth
  sl.registerFactory<LoginUsecase>(
    () => LoginUsecase(authRepository: sl()),
  );
  sl.registerFactory<RegisterUsecase>(
    () => RegisterUsecase(authRepository: sl()),
  );
  sl.registerFactory<GetLocalUserUseCase>(
    () => GetLocalUserUseCase(authRepository: sl()),
  );
  sl.registerFactory<GetLocalTokenUsecase>(
    () => GetLocalTokenUsecase(authRepository: sl()),
  );
  sl.registerFactory<LogoutUsecase>(
    () => LogoutUsecase(authRepository: sl()),
  );

  //bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl()));
  sl.registerFactory<SplashCubit>(() => SplashCubit(sl()));

  await sl.allReady();
}
