import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/place_order/place_order_cubit.dart';

import '../cubit/cart/cart_state.dart';

class PayableAmountWidget extends StatelessWidget {
  final int customerId;
  const PayableAmountWidget({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    final userId = StorageManager.readData(StorageKeys.userId);
    return Container(
      height: 70.h,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Center(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            double total = 0.0;
            bool showUpdateButton = false;

            if (state is CartLoadedState) {
              total = state.totalPrice;
              showUpdateButton = context.read<CartCubit>().isCartUpdated();
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppString.payableAmount,
                      fontWeight: FontWeight.w700,
                      fontSize: AppTextSize.s14,
                    ),
                    CustomText(
                      text:
                          "${AppString.rupeeSymbol}${total.toStringAsFixed(2)}",
                      fontWeight: FontWeight.w700,
                      fontSize: AppTextSize.s14,
                    ),
                  ],
                ),
                showUpdateButton
                    ? CustomButton(
                        onPressed: () {
                          final cartList =
                              context.read<CartCubit>().getFinalCartOrderList();
                          final cartJsonString = jsonEncode(cartList);
                          if (cartList.isNotEmpty) {
                            context.read<CartCubit>().updateQty(
                                cart: cartJsonString, customerId: customerId);
                          }
                        },
                        text: AppString.updateQuantity,
                        color: AppColors.orange,
                        height: 30.h,
                        textSize: AppTextSize.s12,
                        width: 150.w,
                      )
                    : CustomButton(
                        onPressed: () {
                          context.read<PlaceOrderCubit>().placeOrder(
                              userId: userId, customerId: customerId);
                        },
                        text: AppString.placeOrder,
                        height: 30.h,
                        textSize: AppTextSize.s12,
                        width: 120.w,
                      ),
              ],
            );
          },
        ).paddingSymmetric(vertical: 10.h, horizontal: 20.w),
      ),
    );
  }
}
