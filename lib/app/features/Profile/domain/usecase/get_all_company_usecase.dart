import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/usecase/use_case.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_company_response_model.dart';
import 'package:quirckly/app/features/Profile/domain/repository/company_repository.dart';

class GetAllCompanyUsecase
    implements UseCase<Either<Failure, GetAllCompanyResponseModel>, void> {
  final CompanyRepository companyRepository;
  GetAllCompanyUsecase({required this.companyRepository});

  @override
  Future<Either<Failure, GetAllCompanyResponseModel>> call({void params}) {
    return companyRepository.getAllCompany();
  }
}
