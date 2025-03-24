import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? preFixIcon;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.preFixIcon,
      this.validator,
      this.maxLength,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontFamily: AppString.fontFamily, fontWeight: FontWeight.w600),
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: TextStyle(
            color: AppColors.errorColor, fontFamily: AppString.fontFamily),
        counterText: "",
        prefixIcon: preFixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.grey,
            fontFamily: AppString.fontFamily,
            fontSize: AppTextSize.s14),
        disabledBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.grey,
        ),
        focusedBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.primaryColor,
        ),
        enabledBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.black,
        ),
        errorBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.red,
        ),
        focusedErrorBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.red,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
      {required double radius, required Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: color,
        ));
  }
}
