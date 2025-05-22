import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class NetworkFailCard extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  const NetworkFailCard({super.key, required this.message, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          AppImagesKey.networkFail,
          height: 60.h,
          width: 60.w,
        ),
        30.height,
        CustomText(
          text: message,
          fontSize: AppTextSize.s16,
          fontWeight: FontWeight.w600,
        ),
        10.height,
        CustomButton(
          onPressed: onPressed ?? () {},
          text: AppString.retry,
          textSize: AppTextSize.s14,
          height: 20,
          width: 120,
        )
      ]),
    );
  }
}
