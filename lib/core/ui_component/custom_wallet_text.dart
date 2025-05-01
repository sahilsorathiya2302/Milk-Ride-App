import 'package:flutter/cupertino.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_size.dart';
import 'custom_text.dart';

class CustomWalletText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  const CustomWalletText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      textAlign: TextAlign.center,
      text: text,
      fontWeight: fontWeight,
      fontSize: fontSize ?? AppTextSize.s13,
      color: color ?? AppColors.black,
    );
  }
}
