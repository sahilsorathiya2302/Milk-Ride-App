import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/cetegories.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';

import '../../../../../core/constants/app_string.dart';
import '../../cubit/view_all_product_categories/view_all_product_categories_cubit.dart';

class ViewAllProdCategoriesInfoWidget extends StatefulWidget {
  final List<Categories> categories;
  final String selectedCategoryId;

  const ViewAllProdCategoriesInfoWidget(
      {super.key, required this.categories, required this.selectedCategoryId});

  @override
  State<ViewAllProdCategoriesInfoWidget> createState() =>
      _ViewAllProdCategoriesInfoWidgetState();
}

class _ViewAllProdCategoriesInfoWidgetState
    extends State<ViewAllProdCategoriesInfoWidget> {
  void _fetchProducts({required bool isPaginating}) {
    final getId = context.read<ViewAllProductCategoriesCubit>().state;
    final customerId = StorageManager.readData(StorageKeys.customerId);
    context.read<ViewAllProductCubit>().viewAllProduct(
          categoryId: getId.categoryId.toString(),
          customerId: customerId,
          length: 10,
          searchKeyword: AppString.empty,
          isPaginating: isPaginating,
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.categories.length + 1,
      itemBuilder: (context, index) {
        final isAll = index == 0;
        final category = isAll ? null : widget.categories[index - 1];
        final isSelected = isAll
            ? widget.selectedCategoryId == AppString.empty
            : widget.selectedCategoryId == category?.id.toString();

        return InkWell(
          onTap: () {
            context.read<ViewAllProductCategoriesCubit>().selectCategory(
                  isAll ? AppString.empty : category?.id.toString(),
                );

            _fetchProducts(isPaginating: false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              5.width,
              Expanded(
                child: Column(
                  children: [
                    10.height,
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isSelected ? AppColors.white : Colors.transparent,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: isAll
                          ? Icon(Icons.grid_view, color: AppColors.primaryColor)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CustomNetworkImages(
                                src: category?.imageUrl ?? AppString.empty,
                              ),
                            ),
                    ),
                    10.height,
                    CustomText(
                      color: AppColors.darkGrey,
                      text: isAll
                          ? AppString.all
                          : category?.name ?? AppString.empty,
                      fontSize: AppTextSize.s11,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
