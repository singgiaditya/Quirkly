import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quirckly/app/core/errors/failure.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/login_response_model.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final Either<Failure, LoginResponseModel> data =
          await loginUsecase.call(params: event.request);

      data.fold((l) {
        emit(_Error(l));
      }, (r) {
        emit(_Done(r));
      });
    });
  }
}
