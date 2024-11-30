import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/login_response_model.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class LoginUsecase
    implements UseCase<Either<Failure, LoginResponseModel>, LoginRequestModel> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, LoginResponseModel>> call(
      {LoginRequestModel? params}) {
    return authRepository.login(params!);
  }
}
