import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

showConfirmationDialog(
    {void Function()? onPressed,
    IconData? icon,
    String? buttonText,
    Widget? widget,
    required String title,
    required String subTitle}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryLightColor,
                child:
                    Icon(icon ?? Icons.help, size: 30, color: AppColors.white),
              ),
              30.height,
              CustomText(
                textAlign: TextAlign.center,
                maxLine: 2,
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
              widget ??
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.r10),
                            ),
                          ),
                          child: CustomText(
                            text: AppString.cancel,
                            fontWeight: FontWeight.w600,
                            fontSize: AppTextSize.s14,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.r10),
                            ),
                          ),
                          child: CustomText(
                            text: buttonText ?? AppString.yes,
                            fontWeight: FontWeight.w600,
                            fontSize: AppTextSize.s14,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  )
            ],
          ),
        ),
      );
    },
  );
}
