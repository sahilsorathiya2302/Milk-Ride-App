import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_state.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/product_info_card_widget.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';

class ProductInformationWidget extends StatelessWidget {
  final int index;
  final ViewAllProductPackages product;

  const ProductInformationWidget(
      {super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllProductCubit, ViewAllProductState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // FocusManager.instance.primaryFocus?.unfocus();
            Get.toNamed(
              AppRoutesNames.productDetails,
              arguments: {ArgumentKey.productId: product.productId},
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppBorderRadius.r10),
                        topRight: Radius.circular(AppBorderRadius.r10),
                      ),
                      child: CustomNetworkImages(
                        src: product.imageUrl ?? AppString.empty,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ProductInfoCardWidget(
                      product: product,
                    ),
                  ],
                ),
                product.mustTry == true
                    ? Container(
                        height: 20.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppBorderRadius.r10),
                            bottomLeft: Radius.circular(AppBorderRadius.r10),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: AppString.mustTry,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontSize: AppTextSize.s10,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ).paddingOnly(
            left: 10.w,
            right: index % 2 == 1 ? 10.w : 0.w,
            bottom: 10.h,
          ),
        );
      },
    );
  }
}
