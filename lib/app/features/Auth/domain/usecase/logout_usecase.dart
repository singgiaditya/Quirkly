import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class LogoutUsecase implements UseCase<Either<Failure, void>, void> {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call({void params}) {
    return authRepository.logout();
  }
}
