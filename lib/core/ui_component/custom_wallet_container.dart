import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';

import '../constants/app_string.dart';
import '../theme/app_border_radius.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_size.dart';
import 'custom_text.dart';

class CustomWalletContainer extends StatelessWidget {
  final String title;
  final String amount;
  const CustomWalletContainer(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 140.w,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: AppTextSize.s14,
          ),
          10.height,
          CustomText(
            text: "${AppString.rupeeSymbol}$amount",
            fontWeight: FontWeight.w600,
            fontSize: AppTextSize.s14,
          ),
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
