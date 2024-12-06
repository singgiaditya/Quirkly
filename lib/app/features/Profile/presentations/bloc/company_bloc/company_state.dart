part of 'company_bloc.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.initial() = _Initial;
  const factory CompanyState.loading() = _Loading;
  const factory CompanyState.done(GetAllCompanyResponseModel response) = _Done;
  const factory CompanyState.error(Failure failure) = _Error;
}
