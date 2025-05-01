import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/history/domain/entities/recharge_history_data.dart';

import '../../../../../core/ui_component/custom_divider.dart';

class RechargeHistoryInfoWidget extends StatefulWidget {
  final List<RechargeHistoryData>? rechargeHistoryData;
  const RechargeHistoryInfoWidget(
      {super.key, required this.rechargeHistoryData});

  @override
  State<RechargeHistoryInfoWidget> createState() =>
      _RechargeHistoryInfoWidgetState();
}

class _RechargeHistoryInfoWidgetState extends State<RechargeHistoryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.rechargeHistoryData?.length,
      itemBuilder: (context, index) {
        final rechargeHistory = widget.rechargeHistoryData?[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: rechargeHistory?.date ?? "",
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s16,
            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
            Container(
              decoration: BoxDecoration(color: AppColors.white),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rechargeHistory?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final rechargeHistoryData = rechargeHistory?.data?[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: rechargeHistoryData?.createdAt ?? "",
                            fontWeight: FontWeight.w600,
                          ),
                          5.height,
                          CustomText(
                            text: rechargeHistoryData?.walletReason ?? "",
                            color: AppColors.green,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "+",
                            color: AppColors.green,
                            fontSize: AppTextSize.s16,
                            fontWeight: FontWeight.w600,
                          ),
                          2.width,
                          CustomText(
                            text:
                                "${AppString.rupeeSymbol}${rechargeHistoryData?.amount ?? ""}",
                            color: AppColors.green,
                            fontSize: AppTextSize.s12,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 15.w, vertical: 5.h);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
