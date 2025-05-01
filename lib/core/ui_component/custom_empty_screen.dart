import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomEmptyScreen extends StatelessWidget {
  final String text;
  final String? subText;
  final String imagesPath;
  final String buttonText;
  final double? imgHeight;
  final double? imgWidth;
  final void Function() onPressed;
  const CustomEmptyScreen(
      {super.key,
      required this.text,
      required this.imagesPath,
      this.subText,
      required this.buttonText,
      required this.onPressed,
      this.imgHeight,
      this.imgWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagesPath,
            height: imgHeight ?? 120.h,
            width: imgWidth ?? 120.w,
          ),
          10.height,
          CustomText(
            text: text,
            fontWeight: FontWeight.w700,
            fontSize: AppTextSize.s14,
          ),
          CustomText(
              textAlign: TextAlign.center,
              maxLine: 2,
              text: subText ?? AppString.empty,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
              fontSize: subText != null ? AppTextSize.s14 : AppTextSize.s0),
          10.height,
          CustomButton(
            onPressed: onPressed,
            text: buttonText,
            width: 220,
            textSize: AppTextSize.s16,
          )
        ],
      ),
    );
  }
}
