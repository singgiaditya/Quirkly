import 'package:get_it/get_it.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:quirckly/app/features/Auth/data/repository/auth_repository_impl.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/login_usecase.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/register_usecase.dart';
import 'package:quirckly/app/features/Auth/presentations/bloc/login_bloc/login_bloc.dart';
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
  sl.registerFactory<LoginUsecase>(
    () => LoginUsecase(authRepository: sl()),
  );
  sl.registerFactory<RegisterUsecase>(
    () => RegisterUsecase(authRepository: sl()),
  );

  //bloc
  sl.registerFactory(() => LoginBloc(sl()));

  await sl.allReady();
}
