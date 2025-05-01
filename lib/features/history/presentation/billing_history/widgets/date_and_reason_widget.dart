import 'package:flutter/cupertino.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui_component/custom_wallet_text.dart';
import '../../../domain/entities/billing_history_info_data.dart';

class DateAndReasonWidget extends StatelessWidget {
  final BillingHistoryInfoData billingHistoryData;
  const DateAndReasonWidget({super.key, required this.billingHistoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomWalletText(text: billingHistoryData.date ?? ""),
        CustomWalletText(
            text: billingHistoryData.reason ?? "", color: AppColors.grey),
      ],
    );
  }
}
