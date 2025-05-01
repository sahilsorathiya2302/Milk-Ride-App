import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';

class SubscriptionTileWidget extends StatelessWidget {
  final SubscriptionData tileState;

  const SubscriptionTileWidget({
    super.key,
    required this.tileState,
  });
  String _formatFrequency(String? freq) {
    final value = freq?.toLowerCase() ?? '';
    switch (value) {
      case 'alternate_day':
        return 'Alternate Day';
      case 'every_3_day':
        return 'Every 3 Day';
      case 'every_day':
        return 'Every Day';
      case 'day_wise':
        return 'Day Wise';
      default:
        return freq ?? '';
    }
  }

  String _capitalize(String? text) {
    if (text == null || text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    print("frequencyType: ${_formatFrequency(tileState.frequencyType)}");

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            AppBorderRadius.r15,
          ),
          topRight: Radius.circular(
            AppBorderRadius.r15,
          )),
      child: Container(
        height: 35.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: tileState.pauseSubscription == null
                ? AppColors.lightGreen
                : AppColors.lightOrange1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text:
                  "${_formatFrequency(tileState.frequencyType)} ${AppString.dot} ${_capitalize(tileState.deliveryType)}",
              color: tileState.pauseSubscription == null
                  ? AppColors.darkGreen
                  : AppColors.orange,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text:
                  "  ${AppString.dot}  ${tileState.pauseSubscription == null ? AppString.active : AppString.pause}",
              color: tileState.pauseSubscription == null
                  ? AppColors.darkGreen
                  : AppColors.orange,
              fontWeight: FontWeight.w600,
            ),
          ],
        ).paddingSymmetric(horizontal: 10.w),
      ),
    );
  }
}
