import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class DeliveryAddressWidgets extends StatefulWidget {
  final dynamic deliveryState;
  const DeliveryAddressWidgets({super.key, required this.deliveryState});

  @override
  State<DeliveryAddressWidgets> createState() => _DeliveryAddressWidgetsState();
}

class _DeliveryAddressWidgetsState extends State<DeliveryAddressWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.r12,
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Icon(AppIcons.location),
            ],
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.deliveryAddress,
                fontSize: AppTextSize.s14,
                fontWeight: FontWeight.w600,
              ),
              5.height,
              Expanded(
                child: CustomText(
                  maxLine: 2,
                  text: widget.deliveryState.deliveryAddress,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextSize.s12,
                ),
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 15.h),
    );
  }
}
