import 'package:bloc/bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product/product_state.dart';

import '../../../../../core/utils/functional_component.dart';

class ProductCubit extends Cubit<ProductState> {
  final CategoriesProductUseCase categoriesProductUseCase;

  ProductCubit({
    required this.categoriesProductUseCase,
  }) : super(ProductInitial());

  Future<void> categoriesProduct(
      {required int customerId, required categoryId}) async {
    emit(ProductLoading());
    final result = await categoriesProductUseCase.call(
        CategoriesProductParam(categoryId: categoryId, customerId: customerId));

    result.fold(
      (failure) {
        print("MEssage ==========================>${failure.message}");
        FunctionalComponent.errorSnackbar(
            title: AppString.error, message: failure.message);
      },
      (result) {
        print("Hello==========================>");
        if (result.status == AppString.success) {
          emit(ProductLoadedState(categoriesProductResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: result.status.toString(),
              message: result.message.toString());
        }
      },
    );
  }
}
