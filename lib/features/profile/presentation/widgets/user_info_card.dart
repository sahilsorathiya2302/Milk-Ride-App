import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/theme/icon_size.dart';
import '../../../../core/ui_component/custom_text.dart';

class UserInfoCard extends StatelessWidget {
  final dynamic customer;

  const UserInfoCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 35,
          backgroundColor: AppColors.black,
          child: CustomText(
            text: customer?.name?.substring(0, 1) ?? "",
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: AppTextSize.s28,
          ),
        ),
        title: CustomText(
          text: customer?.name?.toString() ?? AppString.empty,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ),
        subtitle: Row(
          children: [
            Icon(AppIcons.verified,
                size: IconSize.i18, color: AppColors.primaryColor),
            2.width,
            CustomText(text: AppString.verified, fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }
}
