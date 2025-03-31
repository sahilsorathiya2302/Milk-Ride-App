import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title.dart';

class VerificationTitleWidget extends StatefulWidget {
  final dynamic getArgument;
  const VerificationTitleWidget({super.key, required this.getArgument});

  @override
  State<VerificationTitleWidget> createState() =>
      _VerificationTitleWidgetState();
}

class _VerificationTitleWidgetState extends State<VerificationTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(text: AppString.verification),
        CustomText(
          text: AppString.otpPrompt,
          fontSize: AppTextSize.s16,
          color: AppColors.grey,
        ).paddingSymmetric(vertical: 10.h),
        CustomText(
          text:
              "+91 ${widget.getArgument?[StorageKeys.mobileNumber]?.toString() ?? ""}",
          fontSize: AppTextSize.s16,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
