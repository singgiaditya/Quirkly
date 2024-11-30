import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/logout_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LogoutUsecase logoutUsecase;
  ProfileBloc(this.logoutUsecase) : super(_Initial()) {
    on<_GetLocalUser>((event, emit) async {});
  }
}
