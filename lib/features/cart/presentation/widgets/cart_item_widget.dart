import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_state.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/cart_quantity_sector.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/key/app_images_key.dart';
import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_dialog_box.dart';
import '../../../../core/ui_component/custom_network_images.dart';
import '../../domain/entities/package_data.dart';
import 'order_details_widgets.dart';

class CartItemWidget extends StatefulWidget {
  final List<PackageData> packageState;
  final int customerId;

  const CartItemWidget({
    super.key,
    required this.packageState,
    required this.customerId,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.packageState.length,
          itemBuilder: (context, index) {
            final cartInfo = widget.packageState[index];

            return Container(
              height: 100.h,
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.r8),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                    child: CustomNetworkImages(
                      height: 70.h,
                      width: 70.w,
                      src: cartInfo.imageUrl ?? "",
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryLightColor,
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.r20),
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
                              width: 122.w,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: AppColors.lightOrange,
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.r20),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(AppImagesKey.deliveryBike,
                                      height: 15.h),
                                  2.width,
                                  CustomText(
                                    fontWeight: FontWeight.w600,
                                    text:
                                        "${AppString.deliveryOn} ${cartInfo.deliveryDate}",
                                    fontSize: AppTextSize.s10,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                showDeleteConfirmationDialog(
                                  onPressed: () {
                                    context.read<CartCubit>().removeCartItem(
                                          cartId: cartInfo.cartId ?? 0,
                                          customerId: widget.customerId,
                                        );
                                    Get.back();
                                  },
                                );
                              },
                              child:
                                  Icon(AppIcons.delete, color: AppColors.red),
                            ),
                            15.width,
                          ],
                        ),
                        5.height,
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state is CartLoadedState) {
                              final quantity = state.productQuantities[
                                      cartInfo.cartId ?? 0] ??
                                  1;

                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          text: AppString.rupeeSymbol +
                                              cartInfo.price.toString(),
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
                        )
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 5.h),
            ).paddingSymmetric(vertical: 5.h);
          },
        ),
        10.height,
        OrderDetailsWidgets(),
      ],
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
