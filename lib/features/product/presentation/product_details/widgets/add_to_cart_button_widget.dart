import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final int quantity;
  final int userId;

  const AddToCartButtonWidget({
    super.key,
    required this.quantity,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLightColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
                fixedSize: Size(
                  1.sw,
                  60.h,
                )),
            onPressed: () {
              context.read<CreateSubscriptionCubit>().addToCart(
                  packageId: cubit.selectedProduct?.id ?? 1,
                  customerId: StorageManager.readData(StorageKeys.customerId),
                  userId: userId,
                  frequencyType: AppString.oneTime,
                  frequencyValue: AppString.empty,
                  qty: quantity,
                  schedule: AppString.oneTime,
                  dayWiseQuantity: 0,
                  deliveryType: cubit.deliveryType.toString(),
                  startDate: AppString.empty,
                  endDate: AppString.empty,
                  trialProduct: 0,
                  noOfUsages: 0,
                  productId: cubit.selectedProduct?.productId ?? 1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          "${AppString.rupeeSymbol}${cubit.totalPrice.toStringAsFixed(2)}",
                      fontSize: AppTextSize.s14,
                      fontWeight: FontWeight.w700,
                    ),
                    10.width,
                    CustomText(
                      text: AppString.totalAmount,
                      color: AppColors.darkGrey,
                      fontSize: AppTextSize.s14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                CustomText(
                  text: AppString.addToCart,
                  fontSize: AppTextSize.s14,
                  fontWeight: FontWeight.w700,
                ),
              ],
            )),
        Container(
          height: 8.h,
          color: AppColors.homeBG,
        )
      ],
    );
  }
}
