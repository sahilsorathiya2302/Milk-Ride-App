import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primaryLightColor,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.r5,
        ),
      ),
      child: Row(
        children: [
          10.width,
          Icon(
            AppIcons.notification,
          ),
          10.width,
          CustomText(
            text: AppString.notificationTitle,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
