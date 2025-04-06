import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';

class PurchaseForWidget extends StatelessWidget {
  const PurchaseForWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          onPressed: () {},
          text: AppString.buy,
          height: 10.h,
          width: 150.w,
          textSize: AppTextSize.s14,
        ),
        CustomButton(
          border: true,
          bgWhite: true,
          textBlack: true,
          onPressed: () {},
          text: AppString.subscription,
          height: 10.h,
          width: 150.w,
          textSize: AppTextSize.s14,
        ),
      ],
    );
  }
}
