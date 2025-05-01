import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/temp_change_subscription_use_case.dart';

import 'modify_temporarily_state.dart';

class ModifyTemporarilyCubit extends Cubit<ModifyTemporarilyState> {
  final TempChangeSubscriptionUseCase tempChangeSubscriptionUseCase;
  ModifyTemporarilyCubit({required this.tempChangeSubscriptionUseCase})
      : super(ModifyTemporarilyInitial()) {
    reset();
  }

  Future<void> tempChangeSubscription(
      {required int subscriptionId,
      required String tempStartDate,
      required String tempEndDate,
      required int tempQty}) async {
    Get.context?.loaderOverlay.show();
    final result = await tempChangeSubscriptionUseCase.call(
        TempChangeSubscriptionParam(
            subscriptionId: subscriptionId,
            tempStartDate: tempStartDate,
            tempEndDate: tempEndDate,
            tempQty: tempQty));

    result.fold(
      (failure) {
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) {
        if (result.status == AppString.success) {
          Get.context?.loaderOverlay.hide();
          showConfirmationDialog(
              title: AppString.tempChangeSubscriptionTitle,
              subTitle: AppString.tempChangeSubscriptionSubTitle,
              widget: CustomButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.ok));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  void reset() {
    emit(
      ModifyTemporarilyLoading(
        quantity: 1,
        pickType: AppString.singleDay,
        startDate: '',
        endDate: '',
      ),
    );
  }

  void setCurrentState({
    int? quantity,
    String? pickType,
    String? startDate,
    String? endDate,
  }) {
    emit(
      ModifyTemporarilyLoading(
        quantity: quantity ?? state.quantity,
        pickType: pickType ?? state.pickType,
        startDate: startDate ?? state.startDate,
        endDate: endDate ?? state.endDate,
      ),
    );
  }

  void updateQuantity(int newQuantity) =>
      setCurrentState(quantity: newQuantity);

  void incrementQuantity() => setCurrentState(quantity: state.quantity + 1);

  void decrementQuantity() {
    if (state.quantity > 1) {
      setCurrentState(quantity: state.quantity - 1);
    }
  }

  void updatePickType(String newPickType) =>
      setCurrentState(pickType: newPickType);

  void updateStartDate(String newStartDate) =>
      setCurrentState(startDate: newStartDate);

  void updateEndDate(String newEndDate) => setCurrentState(endDate: newEndDate);
}
