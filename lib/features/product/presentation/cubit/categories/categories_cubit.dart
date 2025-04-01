import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/view_category_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final ViewCategoryUseCase viewCategoryUseCase;
  CategoriesCubit({required this.viewCategoryUseCase})
      : super(CategoriesInitial());

  Future<void> viewCategory(int userId) async {
    final result =
        await viewCategoryUseCase.call(ViewCategoryParam(userId: userId));

    result.fold(
      (failure) =>
          FunctionalComponent.errorSnackbar(AppString.error, failure.message),
      (result) {
        if (result.status == AppString.success) {
          emit(CategoriesLoaded(viewCategoryResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              result.status.toString(), result.message.toString());
        }
      },
    );
  }
}
