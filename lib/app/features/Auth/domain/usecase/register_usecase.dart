import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/register_response_model.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class RegisterUsecase
    implements
        UseCase<Either<Failure, RegisterResponseModel>, RegisterRequestModel> {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  @override
  Future<Either<Failure, RegisterResponseModel>> call(
      {RegisterRequestModel? params}) {
    return authRepository.register(params!);
  }
}
