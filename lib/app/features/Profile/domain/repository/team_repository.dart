import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_team_response.dart';

abstract class TeamRepository {
  Future<Either<Failure, GetAllTeamResponseModel>> getAllTeam();
}
