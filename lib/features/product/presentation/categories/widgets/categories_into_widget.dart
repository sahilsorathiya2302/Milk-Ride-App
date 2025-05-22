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
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories/widgets/categories_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_state.dart';

import '../../../../../core/constants/app_string.dart';

class CategoriesIntoWidget extends StatefulWidget {
  final int customerId;
  final String configImage;

  const CategoriesIntoWidget({
    super.key,
    required this.customerId,
    required this.configImage,
  });

  @override
  State<CategoriesIntoWidget> createState() => _CategoriesIntoWidgetState();
}

final userId = StorageManager.readData(StorageKeys.userId);

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
          return CategoriesShimmerPlaceHolder();
        } else if (state is CategoriesError) {
          return Align(
            alignment: Alignment.center,
            child: NetworkFailCard(message: state.errorMessage),
          );
        } else if (state is CategoriesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CategoriesCubit>().viewCategory(userId);
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
              itemCount: state.viewCategoryResponse.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final categoriesInfo = state.viewCategoryResponse.data?[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutesNames.categoryProduct, arguments: {
                      ArgumentKey.categoryId: categoriesInfo?.id,
                      ArgumentKey.customerId: widget.customerId,
                      ArgumentKey.categoriesName: categoriesInfo?.name,
                      ArgumentKey.configImage: widget.configImage
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppBorderRadius.r8),
                            topLeft: Radius.circular(AppBorderRadius.r8),
                          ),
                          child: CustomNetworkImages(
                            src: categoriesInfo?.imageUrl ?? widget.configImage,
                            height: 110.h,
                          ),
                        ),
                        1.height,
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(AppBorderRadius.r8),
                              bottomLeft: Radius.circular(AppBorderRadius.r8),
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: categoriesInfo?.name.toString() ??
                                  AppString.empty,
                              color: AppColors.black,
                              fontSize: AppTextSize.s12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 7.w, vertical: 10.h),
                );
              },
            ).paddingSymmetric(horizontal: 10),
          );
        } else {
          return CategoriesShimmerPlaceHolder();
        }
      },
    );
  }
}
