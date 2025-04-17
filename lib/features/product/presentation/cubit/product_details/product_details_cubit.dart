import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/product_operation.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/filtered_packages.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductUseCase productUseCase;

  ProductDetailsCubit({required this.productUseCase})
      : super(ProductDetailsInitial());

  List<FilteredPackages>? product;
  FilteredPackages? selectedProduct;
  int quantity = 1;
  String deliveryType = AppString.morning;

  Future<void> productDetails({
    required int customerId,
    required int productId,
  }) async {
    emit(ProductDetailsLoading());
    final result = await productUseCase
        .call(ProductParam(customerId: customerId, productId: productId));
    result.fold(
      (failure) {
        emit(ProductDetailsError(failure: failure.message));
      },
      (result) {
        product = result.data?.filteredPackages;

        if (product != null && product!.isNotEmpty) {
          selectedProduct = product?.first;
          quantity = ProductOperationHelper.resetQtyOnVariantSelect();
        }

        emit(ProductDetailsLoaded(
          productResponse: result,
          selectedVariant: selectedProduct,
          quantity: quantity,
          deliveryType: deliveryType.toString(),
        ));
      },
    );
  }

  void selectVariant({required FilteredPackages variant}) {
    selectedProduct = variant;
    quantity = ProductOperationHelper.resetQtyOnVariantSelect();
    setCurrentState();
  }

  void incrementQty() {
    quantity = ProductOperationHelper.incrementQty(quantity, selectedProduct);
    setCurrentState();
  }

  void decrementQty() {
    quantity = ProductOperationHelper.decrementQty(quantity, selectedProduct);
    setCurrentState();
  }

  void changeDeliveryType(String type) {
    deliveryType = type;
    setCurrentState();
  }

  double get totalPrice =>
      ProductOperationHelper.calculateTotalPrice(quantity, selectedProduct);

  void setCurrentState() {
    if (state is ProductDetailsLoaded) {
      final res = (state as ProductDetailsLoaded).productResponse;
      emit(ProductDetailsLoaded(
        productResponse: res,
        selectedVariant: selectedProduct,
        quantity: quantity,
        deliveryType: deliveryType,
      ));
    }
  }
}
