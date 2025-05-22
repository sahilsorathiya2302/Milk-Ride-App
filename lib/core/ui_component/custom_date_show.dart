import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../theme/app_border_radius.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import 'custom_text.dart';

class CustomDateShow extends StatefulWidget {
  final VoidCallback onTap;
  final DateTime text;
  const CustomDateShow({super.key, required this.onTap, required this.text});

  @override
  State<CustomDateShow> createState() => _CustomDateShowState();
}

class _CustomDateShowState extends State<CustomDateShow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.r10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: DateFormat('dd MMM').format(widget.text),
              fontWeight: FontWeight.w700,
            ),
            Icon(
              AppIcons.arrowDropDown,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
