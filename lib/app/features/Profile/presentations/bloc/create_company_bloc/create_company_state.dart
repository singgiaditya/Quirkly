part of 'create_company_bloc.dart';

@freezed
class CreateCompanyState with _$CreateCompanyState {
  const factory CreateCompanyState.initial() = _Initial;
  const factory CreateCompanyState.loading() = _Loading;
  const factory CreateCompanyState.done(CreateCompanyResponseModel response) = _Done;
  const factory CreateCompanyState.error(Failure failure) = _Error;
}
