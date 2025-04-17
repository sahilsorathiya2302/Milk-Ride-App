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
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_state.dart';

class DeliveryTypeWidget extends StatefulWidget {
  final String morningMessage;
  final String eveningMessage;

  const DeliveryTypeWidget({
    super.key,
    required this.morningMessage,
    required this.eveningMessage,
  });

  @override
  State<DeliveryTypeWidget> createState() => _DeliveryTypeWidgetState();
}

class _DeliveryTypeWidgetState extends State<DeliveryTypeWidget> {
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
            _deliveryButton(AppString.morning, AppString.morning),
            10.width,
            _deliveryButton(AppString.evening, AppString.evening),
          ],
        ),
      ],
    );
  }

  Widget _deliveryMessage() {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();

        return Container(
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(AppBorderRadius.r8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: cubit.deliveryType == AppString.morning
                  ? widget.morningMessage
                  : widget.eveningMessage,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s10,
            ).paddingSymmetric(horizontal: 10.h),
          ),
        );
      },
    );
  }

  Widget _deliveryButton(String label, String type) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        bool isSelected = cubit.deliveryType == type;

        return GestureDetector(
          onTap: () {
            cubit.changeDeliveryType(type);
          },
          child: Container(
            height: 35.h,
            width: 110.w,
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
