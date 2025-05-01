import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/theme/app_text_size.dart';
import '../cubit/cart/cart_cubit.dart';

class CartDeliveryInfoWidget extends StatefulWidget {
  final int index;
  final dynamic packageState;
  const CartDeliveryInfoWidget(
      {super.key, required this.index, this.packageState});

  @override
  State<CartDeliveryInfoWidget> createState() => _CartDeliveryInfoWidgetState();
}

class _CartDeliveryInfoWidgetState extends State<CartDeliveryInfoWidget> {
  final customerId = StorageManager.readData(StorageKeys.customerId);
  @override
  Widget build(BuildContext context) {
    final cartInfo = widget.packageState[widget.index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 20.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(AppBorderRadius.r20),
              ),
              child: Center(
                child: CustomText(
                  fontSize: AppTextSize.s10,
                  text: cartInfo.deliveryType ?? "",
                ),
              ),
            ),
            5.width,
            Container(
              height: 20.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: AppColors.lightOrange,
                borderRadius: BorderRadius.circular(AppBorderRadius.r20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppImagesKey.deliveryBike, height: 15.h),
                  2.width,
                  Center(
                    child: CustomText(
                      fontWeight: FontWeight.w600,
                      text: "${AppString.deliveryOn} ${cartInfo.deliveryDate}",
                      fontSize: AppTextSize.s10,
                    ),
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 5.w),
          ],
        ),
        GestureDetector(
          onTap: () {
            showConfirmationDialog(
              title: AppString.removeCartItemConfirm,
              subTitle: AppString.removeCartProductConfirm,
              onPressed: () {
                context.read<CartCubit>().removeCartItem(
                      cartId: cartInfo.cartId ?? 0,
                      customerId: customerId ?? 0,
                    );
                Get.back();
              },
            );
          },
          child: Icon(AppIcons.delete, color: AppColors.red),
        ),
        15.width,
      ],
    );
  }
}
