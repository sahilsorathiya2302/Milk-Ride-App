import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class UserPersonalDetails extends StatelessWidget {
  final String info;
  final String title;
  const UserPersonalDetails(
      {super.key, required this.info, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
            fontSize: AppTextSize.s12,
          ).paddingSymmetric(horizontal: 10.w),
          CustomText(
            text: info,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            fontSize: AppTextSize.s12,
          ).paddingSymmetric(horizontal: 10),
        ],
      ),
    );
  }
}
