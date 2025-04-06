import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class RecommendedProductWidget extends StatelessWidget {
  const RecommendedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 80,
      decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(
            AppBorderRadius.r5,
          )),
      child: Center(
        child: CustomText(
          text: AppString.mustTry,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
