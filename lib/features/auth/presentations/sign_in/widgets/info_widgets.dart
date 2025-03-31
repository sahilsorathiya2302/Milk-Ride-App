import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class InfoWidgets extends StatelessWidget {
  const InfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: AppString.registerMobileNumberPrompt,
      fontSize: AppTextSize.s12,
      fontWeight: FontWeight.w700,
    );
  }
}
