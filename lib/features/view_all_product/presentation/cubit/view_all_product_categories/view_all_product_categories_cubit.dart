import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_state.dart';

class ViewAllProductCategoriesCubit
    extends Cubit<ViewAllProductCategoriesState> {
  ViewAllProductCategoriesCubit()
      : super(const ViewAllProductCategoriesInitial());

  void selectCategory(String? categoryId) {
    if (categoryId == null) {
      emit(const ViewAllProductCategoriesInitial());
    } else {
      emit(ViewAllProductCategorySelected(categoryId: categoryId));
    }
  }
}
