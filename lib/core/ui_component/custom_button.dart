import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, fixedSize: Size(180, 40)),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: AppTextSize.s18,
        ));
  }
}
