import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_state.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/cart_quantity_sector.dart';

class CartProductDetailsWidget extends StatelessWidget {
  final int index;
  final dynamic packageState;
  const CartProductDetailsWidget(
      {super.key, required this.index, this.packageState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          final cartInfo = packageState[index];
          final quantity = state.productQuantities[cartInfo.cartId ?? 0] ?? 1;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemInfo(
                      text: cartInfo.name.toString(),
                      textColor: AppColors.black,
                    ),
                    itemInfo(
                      text:
                          "${cartInfo.packageSize}${cartInfo.volume} x $quantity",
                    ),
                    itemInfo(
                      text: AppString.rupeeSymbol + cartInfo.price.toString(),
                      textColor: AppColors.black,
                    ),
                  ],
                ),
              ),
              CartQuantitySector(
                cartId: cartInfo.cartId ?? 0,
                minQuantity: cartInfo.minQtyAllow ?? 1,
                maxQuantity: cartInfo.maxQtyAllow ?? 50,
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  CustomText itemInfo({required String text, Color? textColor}) {
    return CustomText(
      maxLine: 1,
      text: text,
      fontWeight: FontWeight.w600,
      fontSize: AppTextSize.s12,
      color: textColor ?? AppColors.grey,
    );
  }
}
