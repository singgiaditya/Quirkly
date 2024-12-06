import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/create_company_response_model.dart';
import 'package:quirckly/app/features/Profile/domain/usecase/create_company_usecase.dart';

part 'create_company_event.dart';
part 'create_company_state.dart';
part 'create_company_bloc.freezed.dart';

class CreateCompanyBloc extends Bloc<CreateCompanyEvent, CreateCompanyState> {
  final CreateCompanyUsecase createCompanyUsecase;
  CreateCompanyBloc(this.createCompanyUsecase) : super(_Initial()) {
    on<_CreateCompany>((event, emit) async {
      emit(_Loading());
      final response = await createCompanyUsecase.call(params: event.request);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Done(r)),
      );
    });
  }
}
