import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/add_button_widget.dart';

class ProductInfoCardWidget extends StatelessWidget {
  final ViewAllProductPackages product;
  const ProductInfoCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomText(
                text: product.brand ?? AppString.empty,
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
                maxLine: 1,
              ),
            ),
            Image.asset(
              AppImagesKey.foodType,
              height: 10.h,
            ),
          ],
        ),
        CustomText(
          maxLine: 1,
          text: product.name ?? AppString.empty,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          text:
              "${product.packageSize ?? AppString.empty}${product.volume ?? AppString.empty}",
          fontWeight: FontWeight.w700,
          color: AppColors.grey,
        ),
        Row(
          children: [
            CustomText(
              text:
                  "${AppString.rupeeSymbol}${double.parse(product.salePrice.toString()).toStringAsFixed(0)}",
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
            5.width,
            CustomText(
              textDecoration: TextDecoration.lineThrough,
              text:
                  "${AppString.rupeeSymbol}${double.parse(product.mrpPrice.toString()).toStringAsFixed(0)}",
              color: AppColors.grey,
            ),
            const Spacer(),
            AddButtonWidget(
              product: product,
            ),
            5.width,
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 5.w, vertical: 5.h);
  }
}
