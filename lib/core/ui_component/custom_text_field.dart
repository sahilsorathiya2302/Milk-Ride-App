import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? preFixIcon;
  final Icon? sufFixIcon;
  final double? borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final bool? filled;
  final int? maxLength;
  final void Function(String)? onChanged;

  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.preFixIcon,
    this.validator,
    this.maxLength,
    this.keyboardType,
    this.sufFixIcon,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.filled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: TextStyle(
          fontFamily: AppString.fontFamily, fontWeight: FontWeight.w600),
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        errorStyle: TextStyle(
            fontSize: 0,
            color: AppColors.errorColor,
            fontFamily: AppString.fontFamily),
        counterText: "",
        prefixIcon: preFixIcon,
        suffixIcon: sufFixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.grey,
            fontFamily: AppString.fontFamily,
            fontSize: AppTextSize.s14),
        disabledBorder: buildOutlineInputBorder(
          radius: borderRadius ?? AppBorderRadius.r14,
          color: borderColor ?? AppColors.grey,
        ),
        focusedBorder: buildOutlineInputBorder(
          radius: borderRadius ?? AppBorderRadius.r14,
          color: borderColor ?? AppColors.primaryColor,
        ),
        enabledBorder: buildOutlineInputBorder(
          radius: borderRadius ?? AppBorderRadius.r14,
          color: borderColor ?? AppColors.black,
        ),
        errorBorder: buildOutlineInputBorder(
          radius: borderRadius ?? AppBorderRadius.r14,
          color: AppColors.red,
        ),
        focusedErrorBorder: buildOutlineInputBorder(
          radius: borderRadius ?? AppBorderRadius.r14,
          color: AppColors.red,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
      {required double? radius, required Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? AppBorderRadius.r14),
        borderSide: BorderSide(
          color: color,
        ));
  }
}
