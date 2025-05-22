import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/category_product_info_widget.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/view_category_product_place_holder.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

class CategoryProductsMainWidget extends StatefulWidget {
  const CategoryProductsMainWidget({super.key});

  @override
  State<CategoryProductsMainWidget> createState() =>
      _CategoryProductsMainWidgetState();
}

class _CategoryProductsMainWidgetState
    extends State<CategoryProductsMainWidget> {
  final int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchProducts(isPaginating: false);
  }

  void fetchProducts({required bool isPaginating}) {
    final getId = getIt<ViewAllProductCategoriesCubit>().state;
    print(getId.categoryId);

    context.read<ViewAllProductCubit>().viewAllProduct(
          categoryId: getId.categoryId.toString(),
          customerId: StorageManager.readData(StorageKeys.customerId),
          length: 10,
          searchKeyword: AppString.empty,
          isPaginating: isPaginating,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllProductCubit, ViewAllProductState>(
      builder: (context, state) {
        if (state is ViewAllProductLoading && _currentPage == 1) {
          return Expanded(
              child: Center(child: ViewCategoryProductPlaceHolder()));
        } else if (state is ViewAllProductError) {
          return Expanded(child: NetworkFailCard(message: state.errorMessage));
        } else if (state is ViewAllProductLoaded) {
          return Expanded(
            child: CategoryProductInfoWidget(
              packages: state.viewProductResponse.data ?? [],
            ),
          );
        }
        return Expanded(child: ViewCategoryProductPlaceHolder());
      },
    );
  }
}
