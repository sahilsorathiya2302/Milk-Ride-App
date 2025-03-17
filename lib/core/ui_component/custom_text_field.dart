import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.grey),
        disabledBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.black,
        ),
        focusedBorder: buildOutlineInputBorder(
          radius: AppBorderRadius.r14,
          color: AppColors.pink,
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
