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
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_state.dart';

class VariantDeliveryTypeWidget extends StatefulWidget {
  const VariantDeliveryTypeWidget({super.key});

  @override
  State<VariantDeliveryTypeWidget> createState() =>
      _VariantDeliveryTypeWidgetState();
}

class _VariantDeliveryTypeWidgetState extends State<VariantDeliveryTypeWidget> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Get.context?.read<VariantsCubit>().changeDeliveryType(AppString.morning);
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
        Row(
          children: [
            selectDelivery(context,
                label: AppString.morning, type: AppString.morning),
            10.width,
            selectDelivery(context,
                label: AppString.evening, type: AppString.evening),
          ],
        )
      ],
    );
  }

  Widget selectDelivery(BuildContext context,
      {required String label, required String type}) {
    return BlocBuilder<VariantsCubit, VariantsState>(
      builder: (context, state) {
        final cubit = context.read<VariantsCubit>();
        final isSelected = cubit.deliveryType == type;
        return GestureDetector(
          onTap: () {
            context.read<VariantsCubit>().changeDeliveryType(type);
          },
          child: Container(
            height: 35.h,
            width: 72.w,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryLightColor : AppColors.grey,
              borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              border: isSelected
                  ? Border.all(color: AppColors.black, width: 2)
                  : null,
            ),
            child: Center(
              child: CustomText(
                text: label,
                fontSize: AppTextSize.s12,
                color: isSelected ? AppColors.black : AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
