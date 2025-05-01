import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_cancel_use_case.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_state.dart';

import '../../../../../core/storage/storage_keys.dart';
import '../../../../../core/storage/storage_manager.dart';
import '../../../../../core/ui_component/custom_button.dart';

class OrderCancelCubit extends Cubit<OrderCancelState> {
  final OrderCancelUseCase orderCancelUseCase;
  OrderCancelCubit({required this.orderCancelUseCase})
      : super(OrderCancelInitial());

  Future<void> orderCancel(
      {required int orderId,
      required int packageId,
      required int reasonId}) async {
    Get.context!.loaderOverlay.show();
    final result = await orderCancelUseCase.call(OrderCancelParam(
        orderId: orderId, packageId: packageId, reasonId: reasonId));

    result.fold(
      (failure) {
        emit(OrderCancelError(errorMessage: failure.message));
      },
      (result) async {
        final customerId = StorageManager.readData(StorageKeys.customerId);
        final deliveryDate = Get.context?.read<OrderCubit>().state.selectedDate;
        String formattedDate = DateFormat('yyyy-MM-dd').format(deliveryDate!);

        if (result.status == AppString.success) {
          Get.context!.loaderOverlay.hide();
          showConfirmationDialog(
              title: AppString.orderCancelled,
              subTitle: AppString.orderCancelledMessage,
              icon: AppIcons.successIcons,
              widget: CustomButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.ok));
          await Get.context?.read<OrderCubit>().order(
              deliveryDate: formattedDate.toString(),
              customerId: customerId ?? 0);
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? AppString.empty);
        }
      },
    );
    Get.context!.loaderOverlay.hide();
  }
}
