import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_team_response.dart';
import 'package:quirckly/app/features/Profile/domain/repository/team_repository.dart';

class GetAllTeamUsecase
    implements UseCase<Either<Failure, GetAllTeamResponseModel>, void> {
  final TeamRepository teamRepository;
  GetAllTeamUsecase({required this.teamRepository});

  @override
  Future<Either<Failure, GetAllTeamResponseModel>> call({void params}) {
    return teamRepository.getAllTeam();
  }
}
