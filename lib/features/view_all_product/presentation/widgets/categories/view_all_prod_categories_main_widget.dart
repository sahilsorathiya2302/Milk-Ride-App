import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_state.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories/view_product_categories_shimmer_place_holder.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../cubit/view_all_product_categories/view_all_product_categories_state.dart';
import 'view_all_prod_categories_info_widget.dart';

class ViewAllProdCategoriesMainWidget extends StatefulWidget {
  const ViewAllProdCategoriesMainWidget({super.key});

  @override
  State<ViewAllProdCategoriesMainWidget> createState() =>
      _ViewAllProdCategoriesMainWidgetState();
}

class _ViewAllProdCategoriesMainWidgetState
    extends State<ViewAllProdCategoriesMainWidget> {
  @override
  void initState() {
    super.initState();
    final userId = StorageManager.readData(StorageKeys.userId);
    context.read<CategoriesCubit>().viewCategory(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      decoration: BoxDecoration(color: AppColors.white),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, categoryState) {
          if (categoryState is CategoriesLoading) {
            return const ViewProductCategoriesShimmerPlaceHolder();
          } else if (categoryState is CategoriesError) {
            return ViewProductCategoriesShimmerPlaceHolder();
          } else if (categoryState is CategoriesLoaded) {
            final categories = categoryState.viewCategoryResponse.data ?? [];

            return BlocBuilder<ViewAllProductCategoriesCubit,
                ViewAllProductCategoriesState>(
              builder: (context, selectedState) {
                final selectedCategoryId = selectedState.categoryId;

                return ViewAllProdCategoriesInfoWidget(
                  categories: categories,
                  selectedCategoryId: selectedCategoryId ?? "",
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
