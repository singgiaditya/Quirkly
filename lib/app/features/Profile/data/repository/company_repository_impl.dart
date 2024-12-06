import 'package:dartz/dartz.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/core/errors/unknown_failure.dart';
import 'package:quirckly/app/core/errors/validation_failure.dart';
import 'package:quirckly/app/features/Auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:quirckly/app/features/Profile/data/data_sources/remote/company_remote_data_source.dart';
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/create_company_response_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_company_response_model.dart';
import 'package:quirckly/app/features/Profile/domain/repository/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource companyRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  CompanyRepositoryImpl(
      {required this.companyRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, CreateCompanyResponseModel>> createCompany(
      CreateCompanyRequestModel request) async {
    try {
      final token = await authLocalDataSource.getToken();
      final CreateCompanyResponseModel response =
          await companyRemoteDataSource.createCompany(request, token!);
      return Right(response);
    } catch (e) {
      if (e.toString().contains("400")) {
        return Left(ValidationFailure("Please Fill All The Required Fields"));
      }
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }

  @override
  Future<Either<Failure, GetAllCompanyResponseModel>> getAllCompany() async {
    try {
      final token = await authLocalDataSource.getToken();
      final GetAllCompanyResponseModel response =
          await companyRemoteDataSource.getAllCompany(token!);
      return Right(response);
    } catch (e) {
      return Left(UnknownFailure("Unexpected error occurred: $e"));
    }
  }
}
