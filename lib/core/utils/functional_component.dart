import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class FunctionalComponent {
  static void show(BuildContext context, String message,
      {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void successSnackbar(String title, String message) {
    Get.snackbar(
      AppString.empty,
      AppString.empty,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      titleText: CustomText(
        text: title,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: AppTextSize.s16,
      ),
      messageText: CustomText(
        text: message,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: AppTextSize.s16,
      ),
      borderRadius: 8,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      icon: const Icon(AppIcons.successIcons, color: AppColors.white),
    );
  }

  static void errorSnackbar({required String title, required String message}) {
    Get.snackbar(
      AppString.empty,
      AppString.empty,
      titleText: CustomText(
        text: title,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: AppTextSize.s16,
      ),
      messageText: CustomText(
        text: message,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: AppTextSize.s16,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      icon: const Icon(AppIcons.errorIcons, color: AppColors.white),
    );
  }
}
