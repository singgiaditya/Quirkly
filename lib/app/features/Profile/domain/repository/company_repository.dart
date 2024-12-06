import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/create_company_response_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_company_response_model.dart';

abstract class CompanyRepository {
  Future<Either<Failure, CreateCompanyResponseModel>> createCompany(
      CreateCompanyRequestModel request);
  Future<Either<Failure, GetAllCompanyResponseModel>> getAllCompany();
}
