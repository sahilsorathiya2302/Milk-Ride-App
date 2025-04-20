import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../theme/app_icons.dart';

class SelectItemAppBar extends StatelessWidget {
  final String title;
  const SelectItemAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryLightColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppBorderRadius.r15,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                AppIcons.backArrow,
                color: AppColors.black,
              )),
          CustomText(
            text: title,
            fontSize: AppTextSize.s14,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
