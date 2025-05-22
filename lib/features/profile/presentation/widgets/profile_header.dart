import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(AppIcons.backArrow, color: AppColors.black),
        ),
        10.width,
        CustomText(
          text: AppString.myProfile,
          fontSize: AppTextSize.s16,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
