import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';

import '../../../../core/theme/app_border_radius.dart';
import '../cubit/cart/cart_state.dart';

class CartQuantitySector extends StatelessWidget {
  final int cartId;
  final int minQuantity;
  final int maxQuantity;

  const CartQuantitySector({
    super.key,
    required this.cartId,
    this.minQuantity = 1,
    this.maxQuantity = 100,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();

        int quantity = 1;
        if (state is CartLoadedState) {
          quantity = state.productQuantities[cartId] ?? minQuantity;
        }

        return Container(
          height: 30.h,
          width: 102.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.r22),
            border: Border.all(color: AppColors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                icon: AppIcons.remove,
                onPressed: quantity > minQuantity
                    ? () => cubit.decrementQty(cartId)
                    : null,
              ),
              CustomText(
                text: quantity.toString(),
                fontSize: AppTextSize.s16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              _buildIconButton(
                icon: AppIcons.add,
                onPressed: quantity < maxQuantity
                    ? () => cubit.incrementQty(cartId)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: onPressed == null ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}
