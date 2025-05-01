import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final double? height;
  final double? width;
  final String text;
  final double? textSize;
  final bool? border;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.height,
      this.width,
      this.textSize,
      this.border,
      this.textColor,
      this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: border == true
                ? BorderSide(color: AppColors.primaryColor)
                : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
            backgroundColor: color ?? AppColors.primaryColor,
            fixedSize: Size(width ?? 330.w, height ?? 45.h)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: AppColors.white,
                    size: IconSize.i20,
                  )
                : SizedBox(),
            CustomText(
              text: text,
              color: textColor ?? AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? AppTextSize.s18,
            ),
          ],
        ));
  }
}
