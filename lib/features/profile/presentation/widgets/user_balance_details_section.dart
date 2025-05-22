import 'package:flutter/cupertino.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_data.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/user_balance_details.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_icons.dart';

class UserBalanceDetailsSection extends StatelessWidget {
  final ProfileData customer;

  const UserBalanceDetailsSection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserBalanceDetails(
          icon: AppIcons.wallet,
          title: AppString.walletBalance,
          info: "${AppString.rupeeSymbol} ${customer.latestWallet}",
        ),
        10.height,
        UserBalanceDetails(
          icon: AppIcons.credit,
          title: AppString.creditLimit,
          info: "${AppString.rupeeSymbol} ${customer.creditLimit}",
        ),
        10.height,
        UserBalanceDetails(
          icon: AppIcons.person,
          title: AppString.deliveryBoy,
          info:
              "${customer.deliveryBoyName?[0].toUpperCase()}${customer.deliveryBoyName?.substring(1)}",
          // "${customer.address?[0].toUpperCase()}${customer.deliveryBoyName?.substring(1)}",
        ),
      ],
    );
  }
}
