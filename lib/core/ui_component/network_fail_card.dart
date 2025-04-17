import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class NetworkFailCard extends StatelessWidget {
  final String message;
  const NetworkFailCard({super.key, required this.message});
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
        )
      ]),
    );
  }
}
