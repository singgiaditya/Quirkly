import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/register_response_model.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc(this.registerUsecase) : super(_Initial()) {
    on<_Register>((event, emit) async {
      emit(_Loading());
      final response = await registerUsecase.call(params: event.request);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Done(r)));
    });
  }
}
