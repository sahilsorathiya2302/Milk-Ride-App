import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_state.dart';

class CategoriesIntoWidget extends StatefulWidget {
  final int customerId;
  const CategoriesIntoWidget({super.key, required this.customerId});

  @override
  State<CategoriesIntoWidget> createState() => _CategoriesIntoWidgetState();
}

final int userId = StorageManager.readData(StorageKeys.userId);

class _CategoriesIntoWidgetState extends State<CategoriesIntoWidget> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().viewCategory(userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
      if (state is CategoriesLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is CategoriesLoaded) {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
            ),
            itemCount: state.viewCategoryResponse.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final categoriesInfo = state.viewCategoryResponse.data?[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutesNames.categoryProduct, arguments: {
                    ArgumentKey.categoryId: categoriesInfo?.id,
                    ArgumentKey.customerId: widget.customerId
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryLightColor,
                      borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r10),
                        child: CustomNetworkImages(
                          src: categoriesInfo?.imageUrl.toString() ?? "",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      CustomText(
                        text: categoriesInfo?.name.toString() ?? "",
                        color: AppColors.black,
                        fontSize: AppTextSize.s16,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
              );
            },
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
