import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_team_response.dart';
import 'package:quirckly/app/features/Profile/domain/usecase/get_all_team_usecase.dart';

part 'get_all_team_event.dart';
part 'get_all_team_state.dart';
part 'get_all_team_bloc.freezed.dart';

class GetAllTeamBloc extends Bloc<GetAllTeamEvent, GetAllTeamState> {
  final GetAllTeamUsecase getAllTeamUsecase;
  GetAllTeamBloc(this.getAllTeamUsecase) : super(_Initial()) {
    on<GetAllTeamEvent>((event, emit) async {
      emit(_Loading());
      final response = await getAllTeamUsecase.call();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Done(r)),
      );
    });
  }
}
