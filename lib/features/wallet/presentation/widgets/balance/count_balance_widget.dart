import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_data.dart';

class CountBalanceWidget extends StatefulWidget {
  final WalletData? walletData;
  const CountBalanceWidget({super.key, this.walletData});

  @override
  State<CountBalanceWidget> createState() => _CountBalanceWidgetState();
}

class _CountBalanceWidgetState extends State<CountBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCounterContainer(
            title: AppString.walletBalance,
            amount: widget.walletData?.customerData?.wallet ?? "0"),
        buildCounterContainer(
            title: AppString.reserveBalance,
            amount: widget.walletData?.customerData?.creditLimit ?? "0"),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

  Container buildCounterContainer(
      {required String amount, required String title}) {
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
