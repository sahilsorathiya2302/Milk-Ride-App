import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_data.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_item_remove_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_quantity_update_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_state.dart';

import '../../../domain/entities/package_data.dart';

class CartCubit extends Cubit<CartState> {
  final CartUseCase cartUseCase;
  final CartItemRemoveUseCase cartItemRemoveUseCase;
  final CartQuantityUpdateUseCase cartQuantityUpdateUseCase;

  CartCubit({
    required this.cartQuantityUpdateUseCase,
    required this.cartItemRemoveUseCase,
    required this.cartUseCase,
  }) : super(CartInitial());

  Map<int, int> cartQuantities = {};
  PackageData? selectedProduct;

  ///Add To Cart Method....
  Future<void> addToCart({required int customerId}) async {
    emit(CartLoadingState());
    final result = await cartUseCase.call(CartParam(customerId: customerId));

    result.fold(
      (failure) {
        emit(CartErrorState(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success && result.data != null) {
          for (var item in result.data!.package ?? []) {
            if (item.cartId != null) {
              cartQuantities[item.cartId!] = item.qty ?? 1;
            }
          }

          final total = calculateTotalPrice(result.data!);
          emit(CartLoadedState(
            cartResponse: result,
            productQuantities: cartQuantities,
            totalPrice: total,
          ));
        }
      },
    );
  }

  ///Remove Cart Method....
  Future<void> removeCartItem({
    required int cartId,
    required int customerId,
  }) async {
    Get.context!.loaderOverlay.show();

    final result =
        await cartItemRemoveUseCase.call(CartItemRemoveParam(cartId: cartId));

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(message: failure.message);
        Get.context!.loaderOverlay.hide();
      },
      (success) async {
        if (success.status == AppString.success) {
          FunctionalComponent.successMessageSnackbar(
              message: success.message.toString());

          await addToCart(customerId: customerId);
        }
        Get.context!.loaderOverlay.hide();
      },
    );
  }

  ///Update Quantity
  Future<void> updateQty(
      {required String cart, required int customerId}) async {
    Get.context?.loaderOverlay.show();

    final result = await cartQuantityUpdateUseCase
        .call(CartQuantityUpdateParam(cart: cart));
    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(message: failure.message);
        Get.context?.loaderOverlay.hide();
      },
      (result) async {
        if (result.status == AppString.success) {
          FunctionalComponent.successMessageSnackbar(
              message: result.message.toString());
          Get.context?.loaderOverlay.hide();

          await addToCart(customerId: customerId);
        } else {
          FunctionalComponent.errorSnackbar(
              title: AppString.error, message: result.message ?? "");
          Get.context?.loaderOverlay.hide();
        }
      },
    );
  }

  void incrementQty(int cartId) {
    int current = cartQuantities[cartId] ?? 1;
    cartQuantities[cartId] = current + 1;
    setCurrentState();
  }

  bool isCartUpdated() {
    if (state is CartLoadedState) {
      final loadedState = state as CartLoadedState;
      final cartItem = loadedState.cartResponse.data;

      if (cartItem != null) {
        for (var package in cartItem.package ?? []) {
          final id = package.cartId ?? 0;
          final originalQty = package.qty ?? 1;
          final currentQty = loadedState.productQuantities[id] ?? 1;

          if (originalQty != currentQty) return true;
        }
      }
    }
    return false;
  }

  void decrementQty(int cartId) {
    int current = cartQuantities[cartId] ?? 1;
    if (current > 1) {
      cartQuantities[cartId] = current - 1;
      setCurrentState();
    }
  }

  void setCurrentState() {
    if (state is CartLoadedState) {
      final res = (state as CartLoadedState).cartResponse;

      emit(CartLoadedState(
        cartResponse: res,
        productQuantities: Map<int, int>.from(cartQuantities),
        totalPrice: calculateTotalPrice(res.data!),
      ));
    }
  }

  double calculateTotalPrice(CartData cartData) {
    double total = 0.0;
    final items = cartData.package ?? [];

    for (var item in items) {
      final price = item.price ?? "0";
      final cartId = item.cartId!;
      final qty = cartQuantities[cartId] ?? item.qty ?? 1;
      total += double.parse(price) * qty;
    }

    return total;
  }

  List<Map<String, int>> getFinalCartOrderList() {
    List<Map<String, int>> finalList = [];

    if (state is CartLoadedState) {
      final cartData = (state as CartLoadedState).cartResponse.data;
      final quantityMap = (state as CartLoadedState).productQuantities;

      for (var item in cartData?.package ?? []) {
        if (item.cartId != null) {
          final cartId = item.cartId!;
          final qty = quantityMap[cartId] ?? item.qty ?? 1;
          finalList.add({"cart_id": cartId, "qty": qty});
        }
      }
    }

    return finalList;
  }
}
