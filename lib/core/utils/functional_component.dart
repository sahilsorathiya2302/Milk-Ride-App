import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
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

  static void successSnackbar({String? title, required String message}) {
    Get.snackbar(
      AppString.empty,
      AppString.empty,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green[400],
      colorText: Colors.white,
      titleText: title != null
          ? CustomText(
              text: title,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s16,
            )
          : null,
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

  static void errorSnackbar({String? title, required String message}) {
    Get.snackbar(
      AppString.empty,
      AppString.empty,
      titleText: title != null
          ? CustomText(
              text: title,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s16,
            )
          : null,
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

  static void successMessageSnackbar({required String message}) {
    // Get.snackbar(
    //   "", // No title
    //   "", // No message in this param
    //   backgroundColor: Colors.green,
    //   snackPosition: SnackPosition.TOP,
    //   titleText: null,
    //   messageText: Text(
    //     message,
    //     style: const TextStyle(
    //       color: Colors.white,
    //       fontSize: 14, // Regular size
    //       fontWeight: FontWeight.normal, // Not bold
    //     ),
    //   ),
    //   icon: const Icon(AppIcons.successIcons, color: Colors.white, size: 18),
    //   margin: const EdgeInsets.all(10),
    //   borderRadius: 8,
    //   duration: const Duration(seconds: 2),
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    // );
    Get.showSnackbar(GetSnackBar(
      message: "",
      borderRadius: AppBorderRadius.r10,
      margin: EdgeInsets.all(10),
      messageText: CustomText(
        text: message,
        fontWeight: FontWeight.w600,
        fontSize: AppTextSize.s16,
        color: AppColors.white,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: AppColors.green,
      icon: Icon(
        AppIcons.successIcons,
        color: AppColors.white,
      ),
      snackPosition: SnackPosition.TOP,
    ));
  }

  static errorMessageSnackbar({required String message}) {
    Get.showSnackbar(GetSnackBar(
      message: "",
      borderRadius: AppBorderRadius.r10,
      margin: EdgeInsets.all(10),
      messageText: CustomText(
        text: message,
        fontWeight: FontWeight.w600,
        fontSize: AppTextSize.s16,
        color: AppColors.white,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: AppColors.errorSnakbar,
      icon: Icon(
        AppIcons.cancelRounded,
        color: AppColors.white,
      ),
      snackPosition: SnackPosition.TOP,
    ));
  }
}
