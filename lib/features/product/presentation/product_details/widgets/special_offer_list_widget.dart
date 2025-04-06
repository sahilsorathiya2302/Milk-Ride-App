import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/controller/discount_controller.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';

import '../../../../../core/controller/quantity_controller.dart';

class SpecialOfferListWidget extends StatefulWidget {
  final List<dynamic> packages;
  final ValueChanged<double> onPackageSelected;
  final Function(int) onResetQuantity;

  const SpecialOfferListWidget({
    super.key,
    required this.packages,
    required this.onPackageSelected,
    required this.onResetQuantity,
  });

  @override
  State<SpecialOfferListWidget> createState() => _SpecialOfferListWidgetState();
}

class _SpecialOfferListWidgetState extends State<SpecialOfferListWidget> {
  late List<int> offerQuantities;

  final DiscountController discountController = Get.put(DiscountController());
  final ProductQuantityController productQuantityController =
      Get.put(ProductQuantityController());

  @override
  void initState() {
    super.initState();

    offerQuantities = List.generate(widget.packages.length, (_) => 1);

    Future.microtask(() {
      if (widget.packages.isNotEmpty) {
        Get.context!.read<ProductDetailsCubit>().updatePrice(
              double.parse(widget.packages[0].salePrice),
            );
        widget.onPackageSelected(
          double.parse(widget.packages[0].salePrice),
        );
        // widget.onResetQuantity(1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscountController>(
      builder: (controller) {
        return GetBuilder<ProductQuantityController>(
          builder: (controller) {
            return SizedBox(
              height: 90.h,
              child: ListView.builder(
                itemCount: widget.packages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final package = widget.packages[index];

                  return GestureDetector(
                    onTap: () {
                      productQuantityController.setQuantity(1);
                      offerQuantities[discountController.selectedIndex.value] =
                          offerQuantities[
                              discountController.selectedIndex.value];

                      discountController.selectOffer(index);

                      context.read<ProductDetailsCubit>().updatePrice(
                            double.parse(package.salePrice),
                          );

                      widget.onPackageSelected(double.parse(package.salePrice));
                      widget.onResetQuantity(offerQuantities[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
                      child: Container(
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.r12),
                          border: discountController.selectedIndex.value ==
                                  index
                              ? Border.all(color: AppColors.black, width: 1.5)
                              : Border.all(color: Colors.transparent),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                border:
                                    discountController.selectedIndex.value ==
                                            index
                                        ? Border.all(color: AppColors.black)
                                        : Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppBorderRadius.r10),
                                  topRight:
                                      Radius.circular(AppBorderRadius.r10),
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text:
                                      "${package.percentageDifference.toStringAsFixed(0)}% OFF",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            5.height,
                            CustomText(
                              text: "${package.packageSize} ${package.volume}",
                              fontWeight: FontWeight.w700,
                              fontSize: AppTextSize.s12,
                            ),
                            2.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "₹${package.salePrice.toString()}",
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppTextSize.s12,
                                ),
                                5.width,
                                CustomText(
                                  text: AppString.rupeeSymbol +
                                      package.mrpPrice.toString(),
                                  fontWeight: FontWeight.w600,
                                  textDecoration: TextDecoration.lineThrough,
                                  color: AppColors.grey,
                                  fontSize: AppTextSize.s12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
