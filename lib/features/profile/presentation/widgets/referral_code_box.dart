import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';

import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';

class ReferralCodeBox extends StatelessWidget {
  final dynamic customer;

  const ReferralCodeBox({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.referralCode,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s14,
        ),
        10.height,
        Row(
          children: [
            Container(
              width: 270.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              ),
              child: Row(
                children: [
                  CustomText(
                    text: customer?.customerReferrerCode?.toString() ??
                        AppString.empty,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey,
                    fontSize: AppTextSize.s12,
                  ).paddingSymmetric(horizontal: 10.w),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              ),
              child: IconButton(
                onPressed: () {
                  FlutterClipboard.copy(
                          "${customer?.customerReferrerCode?.toString()}")
                      .then((value) =>
                          FunctionalComponent.successMessageSnackbar(
                              message: AppString.referralCopy));
                },
                icon: Icon(AppIcons.copy, color: AppColors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
