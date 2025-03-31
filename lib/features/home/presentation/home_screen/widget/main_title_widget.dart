import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  const MainTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ),
        Spacer(),
        CustomText(
          text: AppString.viewAll,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s14,
          textDecoration: TextDecoration.underline,
        ),
      ],
    ).paddingSymmetric(horizontal: 15.w);
  }
}
