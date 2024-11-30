import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class GetLocalTokenUsecase implements UseCase<Either<Failure, String>, void> {
  final AuthRepository authRepository;

  GetLocalTokenUsecase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call({void params}) {
    return authRepository.getLocalToken();
  }
}
