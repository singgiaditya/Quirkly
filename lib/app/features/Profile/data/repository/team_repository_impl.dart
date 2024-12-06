import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/errors/unknown_failure.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:quirckly/app/features/Profile/data/data_sources/remote/team_remote_data_source.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_team_response.dart';
import 'package:quirckly/app/features/Profile/domain/repository/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource teamRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  TeamRepositoryImpl(this.teamRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, GetAllTeamResponseModel>> getAllTeam() async {
    try {
      final token = await authLocalDataSource.getToken();
      final GetAllTeamResponseModel response =
          await teamRemoteDataSource.getAllTeam(token!);
      return Right(response);
    } catch (e) {
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }
}
