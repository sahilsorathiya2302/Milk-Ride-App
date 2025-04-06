import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../cubit/delivery/delivery_type_cubit.dart';
import '../../cubit/delivery/delivery_type_state.dart';

class DeliverySelector extends StatefulWidget {
  const DeliverySelector({super.key});

  @override
  State<DeliverySelector> createState() => _DeliverySelectorState();
}

class _DeliverySelectorState extends State<DeliverySelector> {
  @override
  void initState() {
    super.initState();

    // Reset to "Morning" when screen opens
    Future.microtask(() {
      context.read<DeliveryTypeCubit>().selectDeliveryType(AppString.morning);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: AppString.chooseDeliveryType,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ),
        10.width,
        BlocBuilder<DeliveryTypeCubit, DeliveryTypeState>(
          builder: (context, state) {
            String selectedType = (state is DeliveryTypeUpdated)
                ? state.deliveryType
                : AppString.morning;

            return Row(
              children: [
                selectDelivery(context,
                    text: AppString.morning,
                    isSelected: selectedType == AppString.morning),
                10.width,
                selectDelivery(context,
                    text: AppString.evening,
                    isSelected: selectedType == AppString.evening),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget selectDelivery(BuildContext context,
      {required String text, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        context.read<DeliveryTypeCubit>().selectDeliveryType(text);
      },
      child: Container(
        height: 35.h,
        width: 72.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLightColor : AppColors.grey,
          borderRadius: BorderRadius.circular(AppBorderRadius.r10),
          border:
              isSelected ? Border.all(color: AppColors.black, width: 2) : null,
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: AppTextSize.s12,
            color: isSelected ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
