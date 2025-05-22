import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/register_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_state.dart';

import '../../../domain/usecases/resend_otp_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final OtpUseCase otpUseCase;
  final ResendOtpUseCase resendOtpUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit(
      {required this.resendOtpUseCase,
      required this.registerUseCase,
      required this.otpUseCase,
      required this.signInUseCase})
      : super(AuthInitial());

  Future<void> postSignInData({
    required String mobileNumber,
    required String userId,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await signInUseCase
        .call(SignInParam(mobileNumber: mobileNumber, userId: userId));

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(
            title: AppString.error, message: failure.message);
      },
      (response) {
        if (response.status == AppString.success) {
          FunctionalComponent.successSnackbar(
              title: response.message, message: response.data);
          Get.toNamed(AppRoutesNames.otpScreen, arguments: {
            ArgumentKey.mobileNumber: mobileNumber,
            ArgumentKey.userId: response.userId
          });

          StorageManager.saveData(StorageKeys.mobileNumber, mobileNumber);
          StorageManager.saveData(StorageKeys.userId, response.userId);
        } else if (response.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: response.status, message: response.message);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> otpCheck({
    required String mobileNumber,
    required int userId,
    required String otp,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await otpUseCase
        .call(OtpParam(mobileNumber: mobileNumber, userId: userId, otp: otp));

    result.fold((failure) {
      FunctionalComponent.errorSnackbar(
          title: AppString.error, message: failure.message.toString());
    }, (result) {
      if (result.status == AppString.success) {
        FunctionalComponent.successSnackbar(
          title: result.status.toString(),
          message: result.message.toString(),
        );
        if (result.message == AppString.userCheckMessage) {
          Get.toNamed(AppRoutesNames.registerScreen, arguments: {
            ArgumentKey.mobileNumber: mobileNumber,
            ArgumentKey.userId: userId
          });
        } else if (result.message == AppString.logicSuccessfully) {
          StorageManager.saveData(StorageKeys.tokenKey, result.appToken);
          StorageManager.saveData(StorageKeys.mobileNumber, mobileNumber);
          StorageManager.saveData(StorageKeys.userId, userId);
          StorageManager.saveData(StorageKeys.customerId, result.customer?.id);
          Get.offAllNamed(AppRoutesNames.mainScreen,
              arguments: {ArgumentKey.customerId: result.customer?.id});
        }
      } else if (result.status == AppString.error) {
        FunctionalComponent.errorSnackbar(
            title: result.status.toString(),
            message: result.message.toString());
      }
    });
    Get.context?.loaderOverlay.hide();
  }

  Future<void> resendOtp(
      {required String mobileNumber,
      required int userId,
      required BuildContext context}) async {
    final result = await resendOtpUseCase
        .call(ResendOtpParam(mobileNumber: mobileNumber, userId: userId));

    result.fold(
      (failure) => FunctionalComponent.errorSnackbar(
          title: AppString.error, message: failure.message),
      (result) {
        if (result.status == AppString.success) {
          FunctionalComponent.successSnackbar(
              title: result.message.toString(),
              message: result.data.toString());
        } else if (result.status == AppString.error) {
          FunctionalComponent.successSnackbar(
              title: result.message.toString(),
              message: result.data.toString());
        }
      },
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String sourceId,
    required String areaId,
    required String houseNo,
    required String floor,
    required String society,
    required String landMark,
    required String city,
    required String area,
    required String pinCode,
    required String regionId,
    required int userId,
    required String referrerCode,
    required String agentCode,
    required String deliveryType,
    required String gender,
    required String mobileNumber,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await registerUseCase.call(RegisterParam(
        name: name,
        email: email,
        sourceId: sourceId,
        areaId: areaId,
        houseNo: houseNo,
        floor: floor,
        society: society,
        landMark: landMark,
        city: city,
        area: area,
        pinCode: pinCode,
        regionId: regionId,
        userId: userId,
        referrerCode: referrerCode,
        agentCode: agentCode,
        deliveryType: deliveryType,
        gender: gender,
        mobileNumber: mobileNumber));

    result.fold(
      (failure) => FunctionalComponent.errorSnackbar(
          title: AppString.error, message: failure.message),
      (result) {
        if (result.status == AppString.success) {
          Get.offAllNamed(AppRoutesNames.mainScreen,
              arguments: {ArgumentKey.customerId: result.customer?.id});

          StorageManager.saveData(StorageKeys.tokenKey, result.appToken);
          StorageManager.saveData(StorageKeys.mobileNumber, mobileNumber);
          StorageManager.saveData(StorageKeys.userId, userId);
          StorageManager.saveData(StorageKeys.customerId, result.customer?.id);
          FunctionalComponent.successSnackbar(
              title: AppString.success, message: result.message.toString());
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: AppString.error, message: result.message.toString());
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }
}
