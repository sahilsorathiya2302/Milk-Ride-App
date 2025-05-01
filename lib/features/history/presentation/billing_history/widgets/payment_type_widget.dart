import 'package:flutter/material.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui_component/custom_wallet_text.dart';
import '../../../domain/entities/billing_history_info_data.dart';

class PaymentTypeWidget extends StatelessWidget {
  final BillingHistoryInfoData billingHistoryData;
  const PaymentTypeWidget({
    super.key,
    required this.billingHistoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWalletText(
            text: billingHistoryData.paymentType != null
                ? billingHistoryData.paymentType![0].toUpperCase() +
                    billingHistoryData.paymentType!.substring(1)
                : "",
            color: AppColors.darkGrey),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomWalletText(
              text: billingHistoryData.paymentType == AppString.credit
                  ? "${AppString.creditIcon} ${AppString.rupeeSymbol}"
                  : "${AppString.debitIcon} ${AppString.rupeeSymbol}",
              fontWeight: FontWeight.w600,
              color: billingHistoryData.paymentType == AppString.credit
                  ? AppColors.green
                  : AppColors.red,
            ),
            CustomWalletText(
              text: billingHistoryData.amount?.toString() ?? "",
              fontWeight: FontWeight.w600,
              color: billingHistoryData.paymentType == AppString.credit
                  ? AppColors.green
                  : AppColors.red,
            ),
          ],
        ),
      ],
    );
  }
}
