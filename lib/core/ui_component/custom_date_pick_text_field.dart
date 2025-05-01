import 'package:flutter/material.dart';

import '../constants/app_string.dart';
import '../theme/app_border_radius.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class CustomDatePickTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function()? onTap;
  const CustomDatePickTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          style: TextStyle(fontFamily: AppString.fontFamily),
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: Icon(AppIcons.calendar),
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
            ),
          ),
        ),
      ),
    );
  }
}
