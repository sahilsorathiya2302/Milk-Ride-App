import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final int? maxLine;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.textDecoration,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.clip,
      maxLines: maxLine,
      text,
      style: TextStyle(
        decoration: textDecoration,
        decorationColor: AppColors.grey,
        color: color ?? AppColors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? AppTextSize.s12,
        fontFamily: AppString.fontFamily,
      ),
    );
  }
}
