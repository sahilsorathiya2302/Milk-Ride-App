import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_data.dart';

import '../../../../../core/key/app_images_key.dart';
import '../../../../../core/ui_component/custom_divider.dart';
import '../../../../../core/ui_component/custom_empty_screen.dart';

class RechargeHistoryInfoWidget extends StatelessWidget {
  final List<RechargeHistoryData>? rechargeHistoryData;
  final DateTime? selectedDate;

  const RechargeHistoryInfoWidget({
    super.key,
    required this.rechargeHistoryData,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure non-null list
    final List<RechargeHistoryData> data = rechargeHistoryData ?? [];

    // Check if selectedDate is not null, and filter
    List<RechargeHistoryData> filteredData;
    if (selectedDate != null) {
      final selectedDateString =
          DateFormat('dd MMM yyyy').format(selectedDate!);

      filteredData = data
          .where(
              (rechargeHistory) => rechargeHistory.date == selectedDateString)
          .toList();
    } else {
      // No date selected, show all
      filteredData = data;
    }

    return filteredData.isEmpty
        ? CustomEmptyScreen(
            text: AppString.rechargeHistoryNotFound,
            imagesPath: AppImagesKey.historyEmpty,
            subText: AppString.rechargeHistoryNotFoundMsg,
            imgWidth: 50,
            imgHeight: 80,
            buttonText: "",
          ).paddingSymmetric(horizontal: 20.w)
        : ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final rechargeHistory = filteredData[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: rechargeHistory.date ?? "",
                    fontWeight: FontWeight.w600,
                    fontSize: AppTextSize.s16,
                  ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  Container(
                    decoration: BoxDecoration(color: AppColors.white),
                    child: ListView.separated(
                      itemCount: rechargeHistory.data?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => CustomDivider(),
                      itemBuilder: (context, i) {
                        final item = rechargeHistory.data?[i];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: item?.createdAt ?? "",
                                  fontWeight: FontWeight.w600,
                                ),
                                5.height,
                                CustomText(
                                  text: item?.walletReason ?? "",
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
                                      "${AppString.rupeeSymbol}${item?.amount ?? ""}",
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
