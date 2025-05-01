import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/features/history/domain/entities/billing_history_data.dart';
import 'package:milk_ride_live_wc/features/history/presentation/billing_history/widgets/date_and_reason_widget.dart';
import 'package:milk_ride_live_wc/features/history/presentation/billing_history/widgets/payment_type_widget.dart';

import '../../../../../core/ui_component/custom_divider.dart';
import '../../../../../core/ui_component/custom_wallet_text.dart';
import 'balance_show_widget.dart';

class BillingHistoryWidget extends StatefulWidget {
  final List<BillingHistoryData>? billingHistoryData;
  const BillingHistoryWidget({super.key, required this.billingHistoryData});

  @override
  State<BillingHistoryWidget> createState() => _BillingHistoryWidgetState();
}

class _BillingHistoryWidgetState extends State<BillingHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.billingHistoryData?.length,
      itemBuilder: (context, index) {
        final billingData = widget.billingHistoryData?[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomWalletText(
                    text: billingData?.date ?? "",
                    fontWeight: FontWeight.w600,
                    fontSize: AppTextSize.s16)
                .paddingSymmetric(horizontal: 10.w, vertical: 20.h),
            Container(
              decoration: BoxDecoration(color: AppColors.white),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: billingData?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final billingHistoryData = billingData?.data?[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateAndReasonWidget(
                        billingHistoryData: billingHistoryData!,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PaymentTypeWidget(
                                billingHistoryData: billingHistoryData),
                            5.height,
                            BalanceShowWidget(
                              billingHistoryData: billingHistoryData,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.w, vertical: 10.h);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
