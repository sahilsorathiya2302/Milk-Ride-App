import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../../../core/constants/app_string.dart';

class MainTitleWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const MainTitleWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ),
        SizedBox(
          height: 40.h,
          child: TextButton(
            onPressed: onPressed,
            child: CustomText(
              text: AppString.viewAll,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s14,
              textDecoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ).paddingOnly(left: 15.w, right: 10.w);
  }
}
