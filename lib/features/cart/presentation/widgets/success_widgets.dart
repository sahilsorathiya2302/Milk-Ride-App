import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title.dart';

class SuccessWidgets extends StatefulWidget {
  const SuccessWidgets({
    super.key,
  });

  @override
  State<SuccessWidgets> createState() => _SuccessWidgetsState();
}

class _SuccessWidgetsState extends State<SuccessWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImagesKey.verified,
              height: 90.h,
              width: 90.w,
            ),
            20.height,
            CustomTitle(
              text: AppString.thankYou,
            ),
            CustomText(
              text: AppString.orderPlaceMessage,
              fontWeight: FontWeight.w500,
              fontSize: AppTextSize.s14,
            ),
            100.height,
            CustomButton(
              onPressed: () {
                Get.offAllNamed(AppRoutesNames.mainScreen);
              },
              text: AppString.continuesShopping,
            )
          ],
        ),
      ),
    );
  }
}
