import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/create_company_response_model.dart';
import 'package:quirckly/app/features/Profile/domain/repository/company_repository.dart';

class CreateCompanyUsecase
    implements
        UseCase<Either<Failure, CreateCompanyResponseModel>,
            CreateCompanyRequestModel> {
  final CompanyRepository companyRepository;
  CreateCompanyUsecase({required this.companyRepository});

  @override
  Future<Either<Failure, CreateCompanyResponseModel>> call(
      {CreateCompanyRequestModel? params}) {
    return companyRepository.createCompany(params!);
  }
}
