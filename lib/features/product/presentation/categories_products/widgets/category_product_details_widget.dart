import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CategoryProductDetailsWidget extends StatelessWidget {
  final String brand;
  final String name;
  final String volume;
  final String packageSize;
  final String mrp;
  final String sellMrp;

  const CategoryProductDetailsWidget(
      {super.key,
      required this.brand,
      required this.name,
      required this.volume,
      required this.packageSize,
      required this.mrp,
      required this.sellMrp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: brand,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s11,
          color: AppColors.grey,
        ),
        Row(
          children: [
            SizedBox(
              width: 110.w,
              child: CustomText(
                maxLine: 2,
                text: name,
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s13,
              ),
            ),
            10.width,
            Image.asset(
              AppImagesKey.foodType,
              height: 15.h,
              width: 15.w,
            )
          ],
        ),
        Row(
          children: [
            packageVolumeText(text: "$packageSize" " $volume"),
          ],
        ),
        Row(
          children: [
            CustomText(
              text: AppString.rupeeSymbol + sellMrp,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s13,
            ),
            5.width,
            CustomText(
              textDecoration: TextDecoration.lineThrough,
              text: AppString.rupeeSymbol + mrp,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s13,
              color: AppColors.grey,
            ),
          ],
        ),
      ],
    );
  }

  CustomText packageVolumeText({required String text}) {
    return CustomText(
      text: text,
      fontWeight: FontWeight.w600,
      fontSize: AppTextSize.s11,
      color: AppColors.grey,
    );
  }
}
