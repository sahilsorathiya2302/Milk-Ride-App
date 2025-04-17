import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_state.dart';

class CategoriesProductCubit extends Cubit<CategoriesProductState> {
  final CategoriesProductUseCase categoriesProductUseCase;
  CategoriesProductCubit({required this.categoriesProductUseCase})
      : super(CategoriesProductInitial());

  Future<void> categoriesProduct(
      {required int customerId, required categoryId}) async {
    emit(CategoriesProductLoading());
    final result = await categoriesProductUseCase.call(
        CategoriesProductParam(categoryId: categoryId, customerId: customerId));

    result.fold(
      (failure) {
        // FunctionalComponent.errorSnackbar(
        //     title: AppString.error, message: failure.message);
        emit(CategoriesProductError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(CategoriesProductLoaded(categoriesProductResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: result.status.toString(),
              message: result.message.toString());
        }
      },
    );
  }
}
