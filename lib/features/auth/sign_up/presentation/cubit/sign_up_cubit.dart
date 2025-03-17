import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/usecase/post_sign_up_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final PostSignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  Future<void> postSignupData({
    required String mobileNumber,
    required int userId,
  }) async {
    emit(SignUpLoading());
    final result = await signUpUseCase(SignUpParam(
      mobileNumber: mobileNumber,
      userId: userId,
    ));

    result.fold(
      (failure) => emit(SignUpFail(message: failure.message)),
      (response) {
        if (response.status == "success") {
          emit(SignUpSuccess(signUpResponse: response));
        } else {
          emit(SignUpFail(message: response.message ?? "Something went wrong"));
        }
      },
    );
  }
}
