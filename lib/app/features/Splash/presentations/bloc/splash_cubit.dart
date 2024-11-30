import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/get_local_token_usecase.dart';

class SplashCubit extends Cubit<bool?> {
  final GetLocalTokenUsecase getTokenUseCase;

  SplashCubit(this.getTokenUseCase) : super(null);

  /// Fungsi untuk membaca token
  Future<void> checkAuthStatus() async {
    try {
      final token = await getTokenUseCase.call();
      token.fold(
        (l) => emit(false),
        (r) => emit(true),
      ); // True jika token ada, False jika tidak.
    } catch (e) {
      emit(null); // Emit null jika terjadi error.
    }
  }
}
