import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class SubscriptionCustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const SubscriptionCustomButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: AppColors.homeBG,
            borderRadius: BorderRadius.circular(AppBorderRadius.r18)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: IconSize.i18,
            ),
            5.width,
            CustomText(text: title)
          ],
        ),
      ),
    );
  }
}
