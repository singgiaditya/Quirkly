part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.done(LoginResponseModel response) = _Done;
  const factory LoginState.error(Failure failure) = _Error;
}
