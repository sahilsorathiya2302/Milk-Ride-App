import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class NotOrderFoundWidget extends StatefulWidget {
  const NotOrderFoundWidget({super.key});

  @override
  State<NotOrderFoundWidget> createState() => _NotOrderFoundWidgetState();
}

class _NotOrderFoundWidgetState extends State<NotOrderFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImagesKey.notFound,
            height: 40.h,
            width: 40.w,
            color: AppColors.primaryColor,
          ),
          CustomText(
            text: AppString.noOrderFound,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
          ),
          CustomText(
            maxLine: 3,
            text: AppString.noOrderFoundMessage,
            fontSize: 14.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
