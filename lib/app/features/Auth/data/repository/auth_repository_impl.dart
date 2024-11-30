import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/errors/network_failure.dart';
import 'package:quirckly/app/core/errors/server_failure.dart';
import 'package:quirckly/app/core/errors/unknown_failure.dart';
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
        return Left(NetworkFailure("Please check your internet connection"));
      }
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel request) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
