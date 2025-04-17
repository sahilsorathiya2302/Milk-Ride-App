import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/place_order_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/place_order/place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final PlaceOrderUseCase placeOrderUseCase;
  PlaceOrderCubit({required this.placeOrderUseCase})
      : super(PlaceOrderInitial());

  Future<void> placeOrder(
      {required int userId, required int customerId}) async {
    Get.context!.loaderOverlay.show();
    final result = await placeOrderUseCase
        .call(PlaceOrderParam(userId: userId, customerId: customerId));

    result.fold(
      (failure) {
        FunctionalComponent.errorMessageSnackbar(message: failure.message);
      },
      (result) async {
        if (result.status == AppString.success) {
          FunctionalComponent.successMessageSnackbar(
              message: result.message.toString());
          await Get.context!
              .read<CartCubit>()
              .addToCart(customerId: customerId);

          Get.toNamed(AppRoutesNames.successScreen);
        } else if (result.message == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message.toString());
        }
      },
    );
    Get.context!.loaderOverlay.hide();
  }
}
