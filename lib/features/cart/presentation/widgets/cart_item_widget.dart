import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/cart_product_details_widget.dart';

import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui_component/custom_network_images.dart';
import '../../domain/entities/package_data.dart';
import 'cart_delivery_Info_widget.dart';
import 'order_details_widgets.dart';

class CartItemWidget extends StatefulWidget {
  final List<PackageData> packageState;

  const CartItemWidget({
    super.key,
    required this.packageState,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CartDeliveryInfoWidget(
                          index: index,
                          packageState: widget.packageState,
                        ),
                        10.height,
                        CartProductDetailsWidget(
                          index: index,
                          packageState: widget.packageState,
                        ),
                      ],
                    ),
                  )
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
}
