import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/cache_failure.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/errors/network_failure.dart';
import 'package:quirckly/app/core/errors/server_failure.dart';
import 'package:quirckly/app/core/errors/unknown_failure.dart';
import 'package:quirckly/app/core/global/entities/user_entity.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/login_response_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/register_response_model.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel request) async {
    try {
      final LoginResponseModel response = await remoteDataSource.login(request);

      await localDataSource.saveToken(response.token!);
      await localDataSource.saveUser(response.userEntity!.toRawJson());

      return Right(response);
    } catch (e) {
      if (e.toString().contains("Unauthorized")) {
        return Left(ServerFailure("Password or Email is Invalid"));
      }
      if (e.toString().contains("Network")) {
        return Left(NetworkFailure(e.toString()));
      }
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel request) async {
    try {
      final RegisterResponseModel response =
          await remoteDataSource.register(request);
      await localDataSource.saveToken(response.token!);
      await localDataSource.saveUser(response.userEntity!.toRawJson());
      return Right(response);
    } on Exception catch (e) {
      if (e.toString().contains("Unique")) {
        return Left(ServerFailure("The email has already been taken"));
      }
      if (e.toString().contains("Network")) {
        return Left(NetworkFailure("Please check your internet connection"));
      }
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getLocalUser() async {
    try {
      final userJson =
          await localDataSource.getUser(); // Dari SharedPreferences
      if (userJson != null) {
        final user = UserEntity.fromRawJson(userJson);
        return Right(user);
      } else {
        return Left(CacheFailure("User not found"));
      }
    } catch (e) {
      return Left(CacheFailure("Failed to fetch user data"));
    }
  }

  @override
  Future<Either<Failure, String>> getLocalToken() async {
    try {
      final token = await localDataSource.getToken(); // Dari SharedPreferences
      if (token != null) {
        return Right(token);
      } else {
        return Left(CacheFailure("Token not found"));
      }
    } catch (e) {
      return Left(CacheFailure("Failed to fetch token data"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearCache();
      return Right("Login Success");
    } catch (e) {
      return Left(CacheFailure("Failed to clear cache: ${e.toString()}"));
    }
  }
}
