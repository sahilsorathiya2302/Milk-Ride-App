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
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_state.dart';

import '../cubit/create_subscription_cubit.dart';

class SubscriptionDeliveryTypeWidget extends StatefulWidget {
  const SubscriptionDeliveryTypeWidget({super.key});

  @override
  State<SubscriptionDeliveryTypeWidget> createState() =>
      _SubscriptionDeliveryTypeWidgetState();
}

class _SubscriptionDeliveryTypeWidgetState
    extends State<SubscriptionDeliveryTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.deliveryType,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s14,
        ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
        Container(
          height: 50.h,
          width: context.width,
          decoration: BoxDecoration(color: AppColors.white),
          child: Row(
            children: [
              _deliveryButton(
                  label: AppString.morning, type: AppString.morning),
              10.width,
              _deliveryButton(
                  label: AppString.evening, type: AppString.evening),
            ],
          ).paddingSymmetric(horizontal: 10.w),
        )
      ],
    );
  }

  Widget _deliveryButton({required String label, required String type}) {
    return BlocBuilder<CreateSubscriptionCubit, CreateSubscriptionState>(
      builder: (context, state) {
        final cubit = context.read<CreateSubscriptionCubit>();
        final selectedType = state.deliveryType;
        final isSelected = selectedType == type;

        return GestureDetector(
          onTap: () {
            cubit.changeDeliveryType(type);
          },
          child: Container(
            height: 30.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              color: isSelected ? AppColors.primaryLightColor : Colors.white,
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors.grey,
              ),
            ),
            child: Center(
              child: CustomText(
                text: label,
                fontSize: AppTextSize.s12,
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
