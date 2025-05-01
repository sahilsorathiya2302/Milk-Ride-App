import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_history.dart';

class RecentHistoryWidget extends StatefulWidget {
  final List<WalletHistory> walletHistory;
  const RecentHistoryWidget({super.key, required this.walletHistory});

  @override
  State<RecentHistoryWidget> createState() => _RecentHistoryWidgetState();
}

class _RecentHistoryWidgetState extends State<RecentHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: AppString.resentHistory,
            fontSize: AppTextSize.s14,
            fontWeight: FontWeight.w600,
          ),
          20.height,
          ListView.separated(
            itemCount: widget.walletHistory.length,
            separatorBuilder: (context, index) {
              return CustomDivider();
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final historyData = widget.walletHistory[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: historyData.createdAt ?? AppString.empty,
                        fontWeight: FontWeight.w600,
                      ),
                      5.height,
                      buildText(
                        historyData: historyData,
                        text: historyData.walletReason ?? AppString.empty,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      buildText(
                        historyData: historyData,
                        text: historyData.amountType == AppString.credit
                            ? AppString.creditIcon
                            : AppString.debitIcon,
                      ),
                      buildText(
                        historyData: historyData,
                        textSize: AppTextSize.s14,
                        text:
                            "${AppString.rupeeSymbol}${historyData.amount.toString()}",
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
    );
  }

  Widget buildText(
      {required WalletHistory historyData,
      required String text,
      double? textSize}) {
    return CustomText(
      text: text,
      fontSize: textSize,
      fontWeight: FontWeight.w600,
      color: historyData.amountType == AppString.credit
          ? AppColors.green
          : AppColors.red,
    );
  }
}
