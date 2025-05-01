import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';

import '../theme/app_border_radius.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_size.dart';
import '../theme/icon_size.dart';
import 'custom_text.dart';

class CustomWalletButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  final bool? isSelected;
  const CustomWalletButton(
      {super.key,
      required this.icon,
      required this.title,
      this.onPressed,
      this.isSelected});

  @override
  State<CustomWalletButton> createState() => _CustomWalletButtonState();
}

class _CustomWalletButtonState extends State<CustomWalletButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(160.w, 80.h),
            backgroundColor: widget.isSelected == true
                ? AppColors.primaryColor
                : AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.r10))),
        onPressed: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected == true
                  ? AppColors.white
                  : AppColors.primaryColor,
              size: IconSize.i22,
            ),
            10.height,
            CustomText(
              text: widget.title,
              fontWeight: FontWeight.w600,
              color: widget.isSelected == true
                  ? AppColors.white
                  : AppColors.primaryColor,
              fontSize: AppTextSize.s13,
            ),
          ],
        ));
  }
}
