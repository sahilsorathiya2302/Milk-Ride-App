import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';

import '../cubit/cart/cart_state.dart';

class OrderDetailsWidgets extends StatefulWidget {
  const OrderDetailsWidgets({
    super.key,
  });

  @override
  State<OrderDetailsWidgets> createState() => _OrderDetailsWidgetsState();
}

class _OrderDetailsWidgetsState extends State<OrderDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          text: AppString.orderDetails,
          textSize: AppTextSize.s16,
        ),
        Container(
          height: 110.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.r12,
            ),
          ),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              double total = 0.0;
              if (state is CartLoadedState) {
                total = state.totalPrice;
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppString.subTotal,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: AppString.rupeeSymbol + total.toString(),
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppString.deliveryCharges,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                      CustomText(
                        text: AppString.rupeeSymbol + AppString.zero,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppString.totalAmount,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                      CustomText(
                        text: AppString.rupeeSymbol + total.toString(),
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              );
            },
          ).paddingSymmetric(horizontal: 10.w, vertical: 15.h),
        ),
        10.height,
      ],
    );
  }
}
