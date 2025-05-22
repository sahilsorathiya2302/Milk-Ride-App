import 'package:flutter/cupertino.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_info_data.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui_component/custom_wallet_text.dart';

class BalanceShowWidget extends StatelessWidget {
  final BillingHistoryInfoData billingHistoryData;
  const BalanceShowWidget({super.key, required this.billingHistoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWalletText(text: AppString.balance, color: AppColors.darkGrey),
        CustomWalletText(
            text: billingHistoryData.balance?.toString() ?? "",
            fontWeight: FontWeight.w600),
      ],
    );
  }
}
