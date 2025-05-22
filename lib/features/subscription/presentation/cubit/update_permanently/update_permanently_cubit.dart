import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/update_permanent_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/update_permanently/update_permanently_state.dart';

class UpdatePermanentlyCubit extends Cubit<UpdatePermanentlyState> {
  final UpdatePermanentUseCase updatePermanentUseCase;

  UpdatePermanentlyCubit({required this.updatePermanentUseCase})
      : super(UpdatePermanentlyInitial(quantity: 1));
  void updatePermanentlyInitial() {
    emit(UpdatePermanentlyInitial(quantity: 1));
  }

  Future<void> updatePermanent(
      {required int subscriptionId,
      required String frequencyType,
      required int qty}) async {
    Get.context?.loaderOverlay.show();
    final result = await updatePermanentUseCase.call(UpdatePermanentParam(
        subscriptionId: subscriptionId,
        frequencyType: frequencyType,
        qty: qty));

    result.fold(
      (failure) {
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) {
        if (result.status == AppString.success) {
          showConfirmationDialog(
              title: AppString.updatePermanent,
              subTitle: AppString.updatePermanentMessage,
              widget: CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutesNames.mainScreen,
                        arguments: {ArgumentKey.selectedIndex: 3});
                  },
                  text: AppString.ok));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message.toString());
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  void setCurrentState({
    int? quantity,
  }) {
    emit(
      UpdatePermanentlyLoaded(
        quantity: quantity ?? state.quantity,
      ),
    );
  }

  void updateQuantity(int newQuantity) {
    setCurrentState(quantity: newQuantity);
  }

  void incrementQuantity() {
    setCurrentState(quantity: state.quantity + 1);
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      setCurrentState(quantity: state.quantity - 1);
    }
  }
}
