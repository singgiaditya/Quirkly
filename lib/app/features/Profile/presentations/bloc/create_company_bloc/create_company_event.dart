part of 'create_company_bloc.dart';

@freezed
class CreateCompanyEvent with _$CreateCompanyEvent {
  const factory CreateCompanyEvent.createCompany(
      CreateCompanyRequestModel request) = _CreateCompany;
}
