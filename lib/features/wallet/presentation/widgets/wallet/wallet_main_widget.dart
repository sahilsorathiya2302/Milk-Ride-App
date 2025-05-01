import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_data.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_button.dart';
import '../balance/add_amount_widget.dart';
import '../balance/count_balance_widget.dart';

class WalletMainWidget extends StatefulWidget {
  final WalletData? walletData;
  const WalletMainWidget({super.key, required this.walletData});

  @override
  State<WalletMainWidget> createState() => _WalletMainWidgetState();
}

class _WalletMainWidgetState extends State<WalletMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: Column(
        children: [
          CountBalanceWidget(
            walletData: widget.walletData,
          ),
          CustomButton(
            onPressed: () {
              addAmount(context: context);
            },
            icon: AppIcons.add,
            text: AppString.addAmount,
            textSize: AppTextSize.s14,
          ).paddingSymmetric(horizontal: 10.w)
        ],
      ),
    ).paddingSymmetric(vertical: 15.h, horizontal: 15.w);
  }
}
