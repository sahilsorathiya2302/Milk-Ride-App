import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';

import '../../../../../core/key/app_images_key.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';

class ProductInfoWidget extends StatelessWidget {
  final String brandName;
  final String productName;
  final String foodType;
  const ProductInfoWidget(
      {super.key,
      required this.brandName,
      required this.productName,
      required this.foodType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: brandName,
          fontSize: AppTextSize.s14,
          fontWeight: FontWeight.w600,
          color: AppColors.grey,
        ),
        5.height,
        Row(
          children: [
            CustomText(
              text: productName,
              fontSize: AppTextSize.s16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            10.width,
            // foodType == AppString.foodTypeVeg
            //     ? Image.asset(
            //         AppImagesKey.foodType,
            //         height: 10,
            //         width: 10,
            //       )
            //     : SizedBox(),
            if (foodType == AppString.foodTypeVeg)
              Image.asset(
                AppImagesKey.foodType,
                height: 10.h,
                width: 10.w,
              )
            else if (foodType == AppString.foodTypeVegan)
              Image.asset(
                AppImagesKey.vegan,
                height: 20.h,
                width: 20.w,
              )
          ],
        ),
      ],
    );
  }
}
