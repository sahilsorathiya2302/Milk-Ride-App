import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_wallet_button.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_icons.dart';

class HistoryButtonWidget extends StatelessWidget {
  const HistoryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomWalletButton(
          onPressed: () {
            Get.toNamed(AppRoutesNames.rechargeHistoryScreen);
          },
          icon: AppIcons.restore,
          title: AppString.rechargeHistory,
          isSelected: true,
        ),
        10.width,
        CustomWalletButton(
            isSelected: true,
            onPressed: () {
              Get.toNamed(AppRoutesNames.billingHistoryScreen);
            },
            icon: AppIcons.wallet2,
            title: AppString.billingHistory)
      ],
    ).paddingSymmetric(horizontal: 15.w);
  }
}
