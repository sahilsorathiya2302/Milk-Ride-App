import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/delivery_selector.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/purchase_for_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/total_amount_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_state.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/quantity_selector_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/controller/quantity_controller.dart';
import '../../cubit/product_details/product_details_cubit.dart';
import '../../product_details/widgets/special_offer_list_widget.dart';

void productDetailsSheet({
  required BuildContext context,
  required int productId,
  required int customerId,
}) {
  context.read<ProductDetailsCubit>().product(
        customerId: customerId,
        productId: productId,
      );
  final ProductQuantityController quantityController =
      Get.put(ProductQuantityController());

  showModalBottomSheet(
    backgroundColor: AppColors.homeBG,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(AppBorderRadius.r20)),
    ),
    builder: (context) {
      int quantity = 1; // Set default quantity to 1
      double salePrice = 0; // Initialize salePrice to 0

      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.84,
            maxChildSize: 0.84,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  bool isLoading = state is! ProductDetailsLoaded;
                  final productInformation = (state is ProductDetailsLoaded)
                      ? state.productResponse.data?.filteredPackages
                      : null;

                  if (productInformation != null &&
                      productInformation.isNotEmpty &&
                      salePrice == 0) {
                    salePrice = double.tryParse(
                            productInformation.first.salePrice ?? "0") ??
                        0.0;

                    // 🛠️ Force update UI for correct price in TotalAmountWidget
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {});
                    });
                  }

                  return Skeletonizer(
                    enabled: isLoading,
                    child: Theme(
                      data: ThemeData(
                        scaffoldBackgroundColor: Colors.grey[300],
                        splashColor: Colors.grey[200],
                      ),
                      child: Container(
                        height: 250.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.homeBG,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppBorderRadius.r22),
                            topLeft: Radius.circular(AppBorderRadius.r22),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: isLoading
                                      ? "Loading..."
                                      : productInformation?.first.name ??
                                          "No Name",
                                  fontSize: AppTextSize.s16,
                                  fontWeight: FontWeight.w700,
                                ).paddingSymmetric(horizontal: 10),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(AppIcons.close),
                                ),
                              ],
                            ),
                            SpecialOfferListWidget(
                              onPackageSelected: (value) {
                                setState(() {
                                  salePrice = value;
                                });
                              },
                              packages: productInformation ?? [],
                              onResetQuantity: (q) {
                                quantityController.setQuantity(q);
                                setState(() {
                                  quantity = q;
                                });
                              },
                            ),
                            20.height,
                            Container(
                              height: 210.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.r10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DeliverySelector(),
                                  CustomDivider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TotalAmountWidget(
                                        selaPrice: salePrice.toInt(),
                                        quantity: quantity,
                                      ),
                                      QuantitySelectorWidget(
                                        minQuantity: (productInformation !=
                                                    null &&
                                                productInformation.isNotEmpty)
                                            ? (productInformation
                                                    .first.minQtyAllow ??
                                                1)
                                            : 1,
                                        maxQuantity: (productInformation !=
                                                    null &&
                                                productInformation.isNotEmpty)
                                            ? (productInformation
                                                    .first.maxQtyAllow ??
                                                10)
                                            : 10,
                                        initialQuantity: quantity,
                                        onQuantityChanged: (newQuantity) {
                                          setState(() {
                                            quantity = newQuantity;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  PurchaseForWidget(),
                                ],
                              ).paddingSymmetric(horizontal: 10, vertical: 10),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10.w),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
    },
  );
}
