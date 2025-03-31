import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../constants/app_string.dart';

class CustomTitleWithTextField extends StatelessWidget {
  final String? titleText;
  final TextEditingController? controller;
  final String hintText;
  final Icon? preFixIcon;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTitleWithTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.preFixIcon,
      this.maxLength,
      this.validator,
      this.keyboardType,
      this.titleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: titleText ?? "",
          fontSize: AppTextSize.s14,
          fontWeight: FontWeight.w600,
        ),
        5.height,
        TextFormField(
          style: TextStyle(
              fontFamily: AppString.fontFamily, fontWeight: FontWeight.w600),
          keyboardType: keyboardType,
          maxLength: maxLength,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: AppTextSize.s0),
            counterText: "",
            prefixIcon: preFixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.grey,
                fontFamily: AppString.fontFamily,
                fontSize: AppTextSize.s14),
            disabledBorder: buildOutlineInputBorder(
              radius: AppBorderRadius.r10,
              color: AppColors.grey,
            ),
            focusedBorder: buildOutlineInputBorder(
              radius: AppBorderRadius.r10,
              color: AppColors.primaryColor,
            ),
            enabledBorder: buildOutlineInputBorder(
              radius: AppBorderRadius.r10,
              color: AppColors.black,
            ),
            errorBorder: buildOutlineInputBorder(
              radius: AppBorderRadius.r10,
              color: AppColors.red,
            ),
            focusedErrorBorder: buildOutlineInputBorder(
              radius: AppBorderRadius.r10,
              color: AppColors.red,
            ),
          ),
        ),
      ],
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
