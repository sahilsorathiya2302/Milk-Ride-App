import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/widgets/pin_put_widget.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/widgets/verification_title_widget.dart';

import '../../../../core/theme/app_colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerificationTitleWidget(
            getArgument: Get.arguments,
          ),
          50.height,
          PinPutWidget(),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
