import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_quantity_sector.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_state.dart';

import '../../../../../core/theme/app_text_size.dart';

class ModifyProdInfo extends StatelessWidget {
  final SubscriptionData argument;
  final int qty;

  final void Function()? addOnPressed;
  final void Function()? removeOnPressed;

  const ModifyProdInfo({
    super.key,
    required this.argument,
    this.addOnPressed,
    this.removeOnPressed,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    print(argument.qty);
    return BlocBuilder<ModifyTemporarilyCubit, ModifyTemporarilyState>(
      builder: (context, state) {
        return Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.r10,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                child: CustomNetworkImages(
                  src: argument.imageUrl ?? "",
                  height: 80.h,
                  width: 80.w,
                ),
              ),
              10.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.r10,
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text: argument.deliveryType ?? "",
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontSize: AppTextSize.s10,
                        ),
                      ),
                    ),
                    4.height,
                    CustomText(text: argument.productName ?? ""),
                    6.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text:
                                    "${argument.packageSize} ${argument.volume}"),
                            4.height,
                            Row(
                              children: [
                                CustomText(
                                    text:
                                        "${AppString.rupeeSymbol}${argument.salePrice}"),
                                6.width,
                                CustomText(
                                  text:
                                      "${AppString.rupeeSymbol}${argument.mrpPrice}",
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomQuantitySector(
                          minQuantity: argument.minQtyAllow,
                          maxQuantity: argument.minQtyAllow,
                          addOnPressed: addOnPressed,
                          removeOnPressed: removeOnPressed,
                          quantity: qty.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 10.w),
        );
      },
    );
  }
}
