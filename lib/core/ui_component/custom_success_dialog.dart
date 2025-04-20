import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

void customSuccessDialog({required String title, required String subTitle}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.r20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImagesKey.verified,
              height: 60.h,
              width: 60.w,
            ),
            30.height,
            CustomText(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s14,
            ),
            20.height,
            Align(
              alignment: Alignment.center,
              child: CustomText(
                textAlign: TextAlign.center,
                maxLine: 2,
                text: subTitle,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            30.height,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r10),
                      ),
                    ),
                    child: CustomText(
                      text: AppString.ok,
                      fontWeight: FontWeight.w600,
                      fontSize: AppTextSize.s14,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ).paddingAll(20),
      );
    },
  );
}
