import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/global/entities/user_entity.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/login_response_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/register_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel request);
  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel request);
  Future<Either<Failure, UserEntity>> getLocalUser();
  Future<Either<Failure, String>> getLocalToken();
  Future<Either<Failure, void>> logout();
}
