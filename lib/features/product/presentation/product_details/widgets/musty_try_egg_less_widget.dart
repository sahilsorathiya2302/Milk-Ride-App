import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../../../../core/constants/app_string.dart';

class MustyTryEggLessWidget extends StatelessWidget {
  final bool isMustTry;
  final bool isEggLess;
  const MustyTryEggLessWidget({
    super.key,
    required this.isMustTry,
    required this.isEggLess,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isMustTry == true
            ? sensitiveInfo(color: AppColors.orange, title: AppString.mustTry)
            : SizedBox(),
        10.width,
        isEggLess
            ? sensitiveInfo(color: AppColors.darkGrey, title: AppString.eggLess)
            : SizedBox()
      ],
    );
  }

  Container sensitiveInfo({required String title, required Color color}) {
    return Container(
      height: 30.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppBorderRadius.r5),
      ),
      child: Center(
          child: CustomText(
        text: title,
        color: AppColors.white,
        fontSize: AppTextSize.s12,
        fontWeight: FontWeight.w700,
      )),
    );
  }
}
