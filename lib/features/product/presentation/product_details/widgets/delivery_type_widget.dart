import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../cubit/delivery/delivery_type_cubit.dart';
import '../../cubit/delivery/delivery_type_state.dart';

class DeliveryTypeWidget extends StatelessWidget {
  final String morningMessage;
  final String eveningMessage;

  const DeliveryTypeWidget({
    super.key,
    required this.morningMessage,
    required this.eveningMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _deliveryMessage(),
        const Divider(),
        CustomText(
          text: AppString.deliveryType,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s14,
        ),
        5.height,
        Row(
          children: [
            _deliveryButton(AppString.morning),
            10.width,
            _deliveryButton(AppString.evening),
          ],
        ),
      ],
    );
  }

  Widget _deliveryMessage() {
    return BlocBuilder<DeliveryTypeCubit, DeliveryTypeState>(
      builder: (context, state) {
        String selectedDelivery = state is DeliveryTypeUpdated
            ? state.deliveryType
            : AppString.morning; // Default to Morning

        // Ensure the first selection is applied if not already set
        if (state is! DeliveryTypeUpdated) {
          context
              .read<DeliveryTypeCubit>()
              .selectDeliveryType(AppString.morning);
        }

        return Container(
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(AppBorderRadius.r8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: selectedDelivery == AppString.morning
                  ? morningMessage
                  : eveningMessage,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s10,
            ).paddingSymmetric(horizontal: 10),
          ),
        );
      },
    );
  }

  Widget _deliveryButton(String type) {
    return BlocBuilder<DeliveryTypeCubit, DeliveryTypeState>(
      builder: (context, state) {
        String selectedDelivery = state is DeliveryTypeUpdated
            ? state.deliveryType
            : AppString.morning; // Default value

        bool isSelected = selectedDelivery == type;
        return GestureDetector(
          onTap: () =>
              context.read<DeliveryTypeCubit>().selectDeliveryType(type),
          child: Container(
            height: 35,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              color: isSelected ? AppColors.primaryLightColor : Colors.white,
              border: Border.all(
                  color: isSelected ? AppColors.black : AppColors.grey),
            ),
            child: Center(
              child: CustomText(
                text: type,
                fontSize: AppTextSize.s14,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.black : AppColors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
