import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';

import '../../../../../core/constants/app_string.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VariantsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.totalAmount,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ),
        CustomText(
          text:
              "${AppString.rupeeSymbol}${cubit.totalPrice.toStringAsFixed(2)}",
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ),
      ],
    );
  }
}
