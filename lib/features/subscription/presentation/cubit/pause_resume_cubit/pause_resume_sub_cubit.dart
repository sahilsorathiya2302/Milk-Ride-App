import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/pause_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/resume_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/functional_component.dart';
import 'pause_resume_sub_state.dart';

class PauseResumeSubCubit extends Cubit<PauseResumeSubState> {
  final PauseSubscriptionUseCase pauseSubscriptionUseCase;
  final ResumeSubscriptionUseCase resumeSubscriptionUseCase;
  PauseResumeSubCubit(
      {required this.pauseSubscriptionUseCase,
      required this.resumeSubscriptionUseCase})
      : super(const PauseResumeSubInitial());
  void clearPauseDates() {
    emit(const PauseResumeSubInitial());
  }

  void updatePauseDates({required String startDate, required String endDate}) {
    emit(PauseResumeSubUpdated(
        pauseStartDate: startDate, pauseEndDate: endDate));
  }

  Future<void> pauseSubscription({
    required int subscriptionId,
    required String pauseStartDate,
    required String pauseEndDate,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await pauseSubscriptionUseCase.call(PauseSubscriptionParam(
      subscriptionId: subscriptionId,
      pauseStartDate: pauseStartDate,
      pauseEndDate: pauseEndDate,
    ));

    result.fold(
      (failure) {
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) async {
        final userId = StorageManager.readData(StorageKeys.userId);
        final customerId = StorageManager.readData(StorageKeys.customerId);
        if (result.status == AppString.success) {
          showConfirmationDialog(
              title: AppString.resumeSubscription,
              subTitle: AppString.resumeSubscriptionMessage,
              widget: CustomButton(
                  width: 120.w,
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.ok));
          await Get.context
              ?.read<SubscriptionCubit>()
              .mySubscription(customerId: customerId ?? 0, userId: userId);
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> resumeSubscription({
    required int subscriptionId,
    required int customerId,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await resumeSubscriptionUseCase.call(
      ResumeSubscriptionParam(
        subscriptionId: subscriptionId,
        customerId: customerId,
      ),
    );

    result.fold(
      (failure) {
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) async {
        if (result.status == AppString.success) {
          final userId = StorageManager.readData(StorageKeys.userId);
          showConfirmationDialog(
              title: AppString.resumeSubscription,
              subTitle: AppString.resumeSubscriptionMessage,
              widget: CustomButton(
                  width: 120.w,
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.ok));
          await Get.context
              ?.read<SubscriptionCubit>()
              .mySubscription(customerId: customerId, userId: userId);
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }
}
