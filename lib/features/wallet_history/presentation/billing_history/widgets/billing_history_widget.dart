import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_empty_screen.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_data.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/billing_history/widgets/date_and_reason_widget.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/billing_history/widgets/payment_type_widget.dart';

import '../../../../../core/ui_component/custom_divider.dart';
import '../../../../../core/ui_component/custom_wallet_text.dart';
import 'balance_show_widget.dart';

class BillingHistoryWidget extends StatelessWidget {
  final List<BillingHistoryData>? billingHistoryData;
  final DateTime? selectedDate;

  const BillingHistoryWidget({
    super.key,
    required this.billingHistoryData,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final List<BillingHistoryData> data = billingHistoryData ?? [];

    // Filter data based on selected date
    List<BillingHistoryData> filteredData;
    if (selectedDate != null) {
      final selectedDateString =
          DateFormat('dd MMM yyyy').format(selectedDate!);

      filteredData = data
          .where((billingHistory) => billingHistory.date == selectedDateString)
          .toList();
    } else {
      filteredData = data;
    }

    return filteredData.isEmpty
        ? CustomEmptyScreen(
            text: AppString.billingHistoryNotFound,
            imagesPath: AppImagesKey.historyEmpty,
            subText: AppString.billingHistoryNotFoundMsg,
            imgWidth: 50,
            imgHeight: 80,
            buttonText: "",
          ).paddingSymmetric(horizontal: 20.w)
        : ListView.builder(
            itemCount: filteredData.length, // Use filteredData.length instead
            itemBuilder: (context, index) {
              final billingData =
                  filteredData[index]; // Use filteredData instead
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWalletText(
                    text: billingData.date ?? AppString.empty,
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
                      itemCount: billingData.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final billingHistoryData = billingData.data?[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DateAndReasonWidget(
                              billingHistoryData: billingHistoryData!,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
