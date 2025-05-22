import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/delete_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/my_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionUseCase subscriptionUseCase;
  final DeleteSubscriptionUseCase deleteSubscriptionUseCase;

  SubscriptionCubit({
    required this.deleteSubscriptionUseCase,
    required this.subscriptionUseCase,
  }) : super(SubscriptionInitial());

  Future<void> mySubscription({
    required int customerId,
    required int userId,
  }) async {
    emit(SubscriptionLoading());
    final result = await subscriptionUseCase
        .call(SubscriptionParam(customerId: customerId, userId: userId));

    result.fold(
      (failure) {
        emit(SubscriptionError(
          errorMessage: failure.message.toString(),
        ));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(SubscriptionLoaded(
            subscriptionResponse: result,
          ));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message.toString());
        }
      },
    );
  }

  Future<void> deleteSubscription({
    required int subscriptionId,
    required int customerId,
    required int userId,
  }) async {
    Get.context!.loaderOverlay.show();

    final result = await deleteSubscriptionUseCase
        .call(DeleteSubscriptionParam(subscriptionId: subscriptionId));

    result.fold(
      (failure) {
        emit(SubscriptionError(
          errorMessage: failure.message,
        ));
      },
      (result) async {
        if (result.status == AppString.success) {
          Get.context!.loaderOverlay.show();

          showConfirmationDialog(
            title: AppString.subscriptionDelete,
            subTitle: AppString.subscriptionDeleteMessage,
            icon: AppIcons.successIcons,
            widget: CustomButton(
              width: 120.w,
              onPressed: () {
                Get.back();
              },
              text: AppString.ok,
            ),
          );

          await mySubscription(customerId: customerId, userId: userId);
        }
      },
    );

    Get.context!.loaderOverlay.hide();
  }
}
