import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../theme/app_colors.dart';

class CustomViewButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomViewButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 110.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppBorderRadius.r10),
          bottomRight: Radius.circular(AppBorderRadius.r10),
        ),
      ),
      child: Center(
        child: CustomText(
          text: text,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s12,
        ),
      ),
    );
  }
}
