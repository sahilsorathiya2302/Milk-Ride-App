import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductUseCase productUseCase;

  double selectedPrice = 0.0;
  int selectedQuantity = 1;

  ProductDetailsCubit({required this.productUseCase})
      : super(ProductDetailsInitial());

  Future<void> product({
    required int customerId,
    required int productId,
  }) async {
    emit(ProductDetailsLoading());

    final result = await productUseCase.call(
      ProductParam(customerId: customerId, productId: productId),
    );

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(
          title: AppString.error,
          message: failure.message,
        );
      },
      (result) {
        if (result.status == AppString.success) {
          // ✅ emit with selected price & quantity
          emit(ProductDetailsLoaded(
            productResponse: result,
            selectedPrice: selectedPrice,
            selectedQuantity: selectedQuantity,
          ));
        } else {
          FunctionalComponent.errorSnackbar(
            title: result.status.toString(),
            message: result.message.toString(),
          );
        }
      },
    );
  }

  void updatePrice(double price) {
    selectedPrice = price;
    _refreshState();
  }

  void updateQuantity(int quantity) {
    selectedQuantity = quantity;
    _refreshState();
  }

  void _refreshState() {
    if (state is ProductDetailsLoaded) {
      emit(ProductDetailsLoaded(
        productResponse: (state as ProductDetailsLoaded).productResponse,
        selectedPrice: selectedPrice,
        selectedQuantity: selectedQuantity,
      ));
    }
  }
}
