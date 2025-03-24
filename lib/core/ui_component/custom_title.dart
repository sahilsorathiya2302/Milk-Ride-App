import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';

import '../theme/app_colors.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomTitle({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: AppTextSize.s22,
          fontFamily: AppString.fontFamily),
    );
  }
}
