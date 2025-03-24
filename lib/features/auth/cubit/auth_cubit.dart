import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/auth/cubit/auth_state.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/usecases/otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/usecases/resend_otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/usecase/sign_in_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final OtpUseCase otpUseCase;
  final ResendOtpUseCase resendOtpUseCase;

  AuthCubit(
      {required this.resendOtpUseCase,
      required this.otpUseCase,
      required this.signInUseCase})
      : super(AuthInitial());

  ///Sign In Cubit
  Future<void> postSignInData(
      {required String mobileNumber,
      required String userId,
      required BuildContext context}) async {
    context.loaderOverlay.show();
    final result = await signInUseCase
        .call(SignInParam(mobileNumber: mobileNumber, userId: userId));

    result.fold(
      (failure) {
        context.loaderOverlay.hide();
        emit(AuthError(
          errorMessage: failure.message,
        ));
      },
      (response) {
        context.loaderOverlay.hide();
        if (response.status == AppString.success) {
          FunctionalComponent.successSnackbar(response.message, response.data);
          Get.toNamed(AppRoutesNames.otpScreen, arguments: {
            "mobile_number": mobileNumber,
            "userId": response.userId
          });
          emit(AuthSuccess(
            signInResponse: response,
          ));
        } else if (response.status == AppString.error) {
          emit(AuthFailure(message: response.message));
        }
      },
    );
  }

  ///Otp Check
  Future<void> otpCheck(
      {required String mobileNumber,
      required int userId,
      required String otp,
      required BuildContext context}) async {
    context.loaderOverlay.show();
    final result = await otpUseCase
        .call(OtpParam(mobileNumber: mobileNumber, userId: userId, otp: otp));

    result.fold((failure) {
      context.loaderOverlay.hide();
      FunctionalComponent.errorSnackbar(
          AppString.error, failure.message.toString());

      emit(
        AuthError(errorMessage: failure.message),
      );
    }, (result) {
      if (result.status == AppString.success) {
        FunctionalComponent.successSnackbar(
          result.status.toString(),
          result.message.toString(),
        );
        if (result.message == AppString.userCheckMessage) {
          Get.toNamed(AppRoutesNames.registerScreen);
          context.loaderOverlay.hide();
        } else {
          Get.toNamed(AppRoutesNames.homeScreen);
          context.loaderOverlay.hide();
        }
        emit(AuthSuccess(otpResponse: result));
      } else if (result.status == AppString.error) {
        context.loaderOverlay.hide();
        FunctionalComponent.errorSnackbar(
            result.status.toString(), result.message.toString());
        emit(AuthFailure(message: result.message));
      }
    });
  }

  ///Resend otp
  Future<void> resendOtp(
      {required String mobileNumber,
      required int userId,
      required BuildContext context}) async {
    final result = await resendOtpUseCase
        .call(ResendOtpParam(mobileNumber: mobileNumber, userId: userId));

    result.fold(
      (failure) => emit(AuthError(errorMessage: failure.message)),
      (result) {
        if (result.status == AppString.success) {
          FunctionalComponent.successSnackbar(
              result.message.toString(), result.data.toString());
          emit(AuthSuccess(resendOtpResponse: result));
        } else if (result.status == AppString.error) {
          emit(AuthFailure(message: result.message));
        }
      },
    );
  }
}
