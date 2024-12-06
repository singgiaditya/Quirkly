import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_company_response_model.dart';
import 'package:quirckly/app/features/Profile/domain/usecase/create_company_usecase.dart';
import 'package:quirckly/app/features/Profile/domain/usecase/get_all_company_usecase.dart';

part 'company_event.dart';
part 'company_state.dart';
part 'company_bloc.freezed.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetAllCompanyUsecase getAllCompanyUsecase;
  final CreateCompanyUsecase createCompanyUsecase;
  CompanyBloc(this.getAllCompanyUsecase, this.createCompanyUsecase)
      : super(_Initial()) {
    on<_GetAllCompany>((event, emit) async {
      emit(_Loading());
      final response = await getAllCompanyUsecase.call();
      response.fold(
        (failure) => emit(_Error(failure)),
        (data) => emit(_Done(data)),
      );
    });
  }
}
