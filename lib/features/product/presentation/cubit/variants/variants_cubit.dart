import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/package_data.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/variants_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_state.dart';

import '../../../../../core/utils/product_operation.dart';

class VariantsCubit extends Cubit<VariantsState> {
  final VariantsUseCase variantsUseCase;
  VariantsCubit({required this.variantsUseCase}) : super(VariantsInitial());

  List<PackageData>? variant;

  PackageData? selectedVariant;
  int? quantity;
  String deliveryType = "";

  Future<void> variants({
    required int customerId,
    required int productId,
  }) async {
    emit(VariantsLoading());
    final result = await variantsUseCase
        .call(VariantsParam(customerId: customerId, productId: productId));
    result.fold(
      (failure) {
        emit(VariantsError(errorMessage: failure.message));
      },
      (result) {
        variant = result.data!;

        if (variant != null && variant!.isNotEmpty) {
          selectedVariant = variant?.first;
          quantity = ProductOperationHelper.resetQtyOnVariantSelect();
        }

        emit(VariantsLoaded(
          variantResponse: result,
          quantity: quantity ?? 1,
          deliveryType: deliveryType.toString(),
          selectedVariant: selectedVariant,
        ));
      },
    );
  }

  void selectVariant({required PackageData variant}) {
    selectedVariant = variant;
    quantity = ProductOperationHelper.resetQtyOnVariantSelect();
    setCurrentState();
  }

  void incrementQty() {
    quantity =
        ProductOperationHelper.incrementQty(quantity ?? 1, selectedVariant);
    setCurrentState();
  }

  void decrementQty() {
    quantity =
        ProductOperationHelper.decrementQty(quantity ?? 1, selectedVariant);
    setCurrentState();
  }

  void changeDeliveryType(String type) {
    deliveryType = type;
    setCurrentState();
  }

  double get totalPrice => ProductOperationHelper.calculateTotalPrice(
      quantity ?? 1, selectedVariant);

  void setCurrentState() {
    if (state is VariantsLoaded) {
      final res = (state as VariantsLoaded).variantResponse;
      emit(VariantsLoaded(
        variantResponse: res,
        selectedVariant: selectedVariant,
        quantity: quantity ?? 1,
        deliveryType: deliveryType,
      ));
    }
  }
}
