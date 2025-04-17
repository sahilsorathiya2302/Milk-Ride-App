import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomEmptyScreen extends StatelessWidget {
  final String text;
  final String imagesPath;
  const CustomEmptyScreen(
      {super.key, required this.text, required this.imagesPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagesPath,
            height: 200.h,
            width: 200.w,
          ),
          10.height,
          CustomText(
            text: text,
            fontWeight: FontWeight.w700,
            fontSize: AppTextSize.s14,
          ),
          10.height,
          CustomButton(
            onPressed: () {
              Get.toNamed(AppRoutesNames.bottomNavScreen);
            },
            text: AppString.orderNow,
            width: 220,
            textSize: AppTextSize.s16,
          )
        ],
      ),
    );
  }
}
