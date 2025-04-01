import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomSimpleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const CustomSimpleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: CustomText(
        text: title,
        fontSize: AppTextSize.s16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(50, 50);
}
