import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/global/entities/user_entity.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Auth/domain/repository/auth_repository.dart';

class GetLocalUserUseCase
    implements UseCase<Either<Failure, UserEntity>, void> {
  final AuthRepository authRepository;

  GetLocalUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call({void params}) {
    return authRepository.getLocalUser();
  }
}
