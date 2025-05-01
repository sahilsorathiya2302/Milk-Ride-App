import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/pause_subscription.dart';

class PauseInfoWidget extends StatelessWidget {
  final PauseSubscription pauseSubscription;
  const PauseInfoWidget({
    super.key,
    required this.pauseSubscription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightGrey1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              AppBorderRadius.r15,
            ),
            bottomRight: Radius.circular(
              AppBorderRadius.r15,
            ),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
              maxLine: 2,
              text:
                  "${AppString.pauseSubscriptionInfoMessage} ${pauseSubscription.pauseStartDate} ${AppString.to} ${pauseSubscription.pauseEndDate}"),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
