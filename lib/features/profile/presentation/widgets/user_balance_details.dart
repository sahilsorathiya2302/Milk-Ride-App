import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class UserBalanceDetails extends StatelessWidget {
  final String title;
  final IconData icon;
  final String info;

  const UserBalanceDetails(
      {super.key, required this.title, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration:
                BoxDecoration(color: AppColors.homeBG, shape: BoxShape.circle),
            child: Icon(icon),
          ).paddingSymmetric(horizontal: 10),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title,
                color: AppColors.black,
                fontSize: AppTextSize.s14,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: info,
                color: AppColors.black,
                fontSize: AppTextSize.s16,
                fontWeight: FontWeight.w700,
              ),
            ],
          ).paddingSymmetric(horizontal: 10.w)
        ],
      ),
    );
  }
}
