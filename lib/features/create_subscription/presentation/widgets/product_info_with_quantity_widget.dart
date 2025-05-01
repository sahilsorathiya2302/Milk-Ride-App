import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_state.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/widgets/subscription_quantity_sector.dart';

class ProductInfoWithQuantityWidget extends StatefulWidget {
  final dynamic getArgument;
  const ProductInfoWithQuantityWidget({
    super.key,
    this.getArgument,
  });

  @override
  State<ProductInfoWithQuantityWidget> createState() =>
      _ProductInfoWithQuantityWidgetState();
}

class _ProductInfoWithQuantityWidgetState
    extends State<ProductInfoWithQuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: context.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.r5),
            child: CustomNetworkImages(
              src: widget.getArgument[ArgumentKey.productImage],
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          5.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.getArgument[ArgumentKey.productName],
                fontWeight: FontWeight.w600,
              ),
              5.height,
              Row(
                children: [
                  CustomText(
                    text: widget.getArgument[ArgumentKey.productPackegeSize],
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                  2.width,
                  CustomText(
                    text: widget.getArgument[ArgumentKey.volume],
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ],
              ),
              5.height,
              Row(
                children: [
                  CustomText(
                    text: AppString.rupeeSymbol +
                        widget.getArgument[ArgumentKey.salePrice],
                    fontWeight: FontWeight.w600,
                  ),
                  2.width,
                  CustomText(
                    text: AppString.rupeeSymbol +
                        widget.getArgument[ArgumentKey.mrpPrice],
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                    textDecoration: TextDecoration.lineThrough,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          BlocBuilder<CreateSubscriptionCubit, CreateSubscriptionState>(
            builder: (context, state) {
              return state.deliverySchedule != AppString.dayWise
                  ? SubscriptionQuantitySector(
                      minQuantity: 1,
                      maxQuantity: 50,
                      instantlyQuantity: widget
                          .getArgument[ArgumentKey.selectQuantity.toString()],
                    )
                  : const SizedBox();
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 10),
    ).paddingSymmetric(
      vertical: 10.h,
    );
  }
}
