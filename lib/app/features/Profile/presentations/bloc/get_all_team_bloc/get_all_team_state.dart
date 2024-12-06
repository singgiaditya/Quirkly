part of 'get_all_team_bloc.dart';

@freezed
class GetAllTeamState with _$GetAllTeamState {
  const factory GetAllTeamState.initial() = _Initial;
  const factory GetAllTeamState.loading() = _Loading;
  const factory GetAllTeamState.done(GetAllTeamResponseModel response) = _Done;
  const factory GetAllTeamState.error(Failure failure) = _Error;
}
