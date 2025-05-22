import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';

import '../../../../../core/storage/storage_keys.dart';
import '../../../../../core/storage/storage_manager.dart';
import '../../../../../core/ui_component/custom_text_field.dart';
import '../../cubit/view_all_product/view_all_product_cubit.dart';
import '../../cubit/view_all_product_categories/view_all_product_categories_cubit.dart';

class SearchTextFiledWidget extends StatefulWidget {
  const SearchTextFiledWidget({super.key});

  @override
  State<SearchTextFiledWidget> createState() => _SearchTextFiledWidgetState();
}

class _SearchTextFiledWidgetState extends State<SearchTextFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        child: CustomTextField(
          onChanged: (value) {
            final categoryId =
                context.read<ViewAllProductCategoriesCubit>().state.categoryId;
            final customerId = StorageManager.readData(StorageKeys.customerId);

            context.read<ViewAllProductCubit>().searchProduct(
                  page: 1,
                  length: 10,
                  categoryId: categoryId.toString(),
                  customerId: customerId,
                  searchKeyword: value,
                );
          },
          controller:
              context.read<ViewAllProductCubit>().searchKeywordController,
          hintText: AppString.search,
          borderColor: AppColors.transparent,
          fillColor: AppColors.white,
          filled: true,
        ),
      ),
    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h);
  }
}
