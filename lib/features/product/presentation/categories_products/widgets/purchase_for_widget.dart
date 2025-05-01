import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';

class PurchaseForWidget extends StatelessWidget {
  final double? height;

  final void Function() onPressed;
  final void Function() subscribeOnPressed;

  final double? width;
  final double? textSize;
  const PurchaseForWidget({
    super.key,
    this.height,
    this.width,
    this.textSize,
    required this.onPressed,
    required this.subscribeOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: onPressed,
          text: AppString.buy,
          height: height ?? 10.h,
          width: width ?? 150.w,
          textSize: textSize ?? AppTextSize.s14,
        ),
        10.width,
        CustomButton(
          text: AppString.subscribe,
          border: true,
          color: AppColors.white,
          textColor: AppColors.black,
          onPressed: subscribeOnPressed,
          height: height ?? 10.h,
          width: width ?? 150.w,
          textSize: textSize ?? AppTextSize.s14,
        ),
      ],
    );
  }
}
