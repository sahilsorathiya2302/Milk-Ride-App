import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class TotalAmountWidget extends StatelessWidget {
  final int selaPrice;
  final int quantity;
  const TotalAmountWidget(
      {super.key, required this.selaPrice, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.totalAmount,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ),
        CustomText(
          text: "${AppString.rupeeSymbol}${selaPrice * quantity}",
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ),
      ],
    );
  }
}
