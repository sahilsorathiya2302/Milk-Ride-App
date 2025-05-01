import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title.dart';

class CustomOrderDetails extends StatelessWidget {
  final String subTotal;
  final String? amountTitle;
  final String amount;
  const CustomOrderDetails(
      {super.key,
      required this.subTotal,
      this.amountTitle,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          text: AppString.orderDetails,
          textSize: AppTextSize.s14,
        ),
        10.height,
        Container(
          height: 110.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.r10,
            ),
          ),
          child: Column(
            children: [
              text(
                title: AppString.subTotal,
                value: "${AppString.rupeeSymbol}$subTotal",
              ),
              5.height,
              text(
                  title: AppString.deliveryCharges,
                  value: AppString.rupeeSymbol + AppString.zero,
                  color: AppColors.darkGrey),
              5.height,
              CustomDivider(),
              text(
                title: amountTitle ?? AppString.totalAmount,
                color: AppColors.darkGrey,
                value: "${AppString.rupeeSymbol}$amount",
              ),
            ],
          ).paddingSymmetric(horizontal: 10.w, vertical: 15.h),
        ),
        10.height,
      ],
    );
  }

  Widget text({
    required String title,
    required String value,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.black,
        ),
        CustomText(
          text: value,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ],
    );
  }
}
