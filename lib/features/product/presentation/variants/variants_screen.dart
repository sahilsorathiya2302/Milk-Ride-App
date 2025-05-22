import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_quantity_sector.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/purchase_for_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_state.dart';
import 'package:milk_ride_live_wc/features/product/presentation/variants/widgets/total_amount_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/variants/widgets/variant_delivery_type_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/variants/widgets/variant_special_offer_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

void variantSheet({
  required BuildContext context,
  required int productId,
  required int packageId,
}) {
  final cubit = context.read<VariantsCubit>();
  final userId = StorageManager.readData(StorageKeys.userId);
  final customerId = StorageManager.readData(StorageKeys.customerId);

  context
      .read<VariantsCubit>()
      .variants(customerId: customerId, productId: productId);
  showModalBottomSheet(
    backgroundColor: AppColors.homeBG,
    useRootNavigator: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(AppBorderRadius.r20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.84,
            maxChildSize: 0.84,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return BlocBuilder<VariantsCubit, VariantsState>(
                builder: (context, state) {
                  if (state is VariantsError) {
                    return Center(
                        child: NetworkFailCard(message: state.errorMessage));
                  }
                  bool isLoading = state is! VariantsLoaded;

                  final variantInformation =
                      (state is VariantsLoaded) ? state.variantResponse : null;

                  return Skeletonizer(
                    enabled: isLoading,
                    child: Theme(
                      data: ThemeData(
                        scaffoldBackgroundColor: AppColors.grey,
                        splashColor: AppColors.grey,
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
                                      ? AppString.loading
                                      : variantInformation?.data?.first.name ??
                                          AppString.noName,
                                  fontSize: AppTextSize.s16,
                                  fontWeight: FontWeight.w700,
                                ).paddingSymmetric(horizontal: 10),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(AppIcons.close),
                                ),
                              ],
                            ),
                            VariantSpecialOfferWidget(
                              packages: variantInformation?.data ?? [],
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
                                  VariantDeliveryTypeWidget(),
                                  CustomDivider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TotalAmountWidget(),
                                      CustomQuantitySector(
                                        maxQuantity: variantInformation
                                                ?.data?[0].maxQtyAllow ??
                                            1,
                                        minQuantity: variantInformation
                                                ?.data?[0].minQtyAllow ??
                                            50,
                                        quantity: cubit.quantity.toString(),
                                        removeOnPressed: () {
                                          cubit.decrementQty();
                                        },
                                        addOnPressed: () {
                                          cubit.incrementQty();
                                        },
                                      ),
                                      // VariantQuantitySectorWidget(),
                                    ],
                                  ),
                                  PurchaseForWidget(
                                    subscribeOnPressed: () {
                                      final cubit =
                                          context.read<VariantsCubit>();
                                      Get.toNamed(
                                        AppRoutesNames.createSubscriptionScreen,
                                        arguments: {
                                          ArgumentKey.customerId: customerId,
                                          ArgumentKey.productId:
                                              cubit.selectedVariant?.productId,
                                          ArgumentKey.packageId:
                                              cubit.selectedVariant?.id,
                                          ArgumentKey.productName:
                                              cubit.selectedVariant?.name,
                                          ArgumentKey.productImage:
                                              cubit.selectedVariant?.imageUrl,
                                          ArgumentKey.volume:
                                              cubit.selectedVariant?.volume,
                                          ArgumentKey.productPackegeSize: cubit
                                              .selectedVariant?.packageSize,
                                          ArgumentKey.salePrice:
                                              cubit.selectedVariant?.salePrice,
                                          ArgumentKey.mrpPrice:
                                              cubit.selectedVariant?.mrpPrice,
                                          ArgumentKey.selectQuantity:
                                              cubit.quantity,
                                          ArgumentKey.deliveryType:
                                              cubit.deliveryType,
                                        },
                                      );
                                    },
                                    onPressed: () {
                                      Get.back();
                                      context
                                          .read<CreateSubscriptionCubit>()
                                          .addToCart(
                                            packageId:
                                                cubit.selectedVariant?.id ?? 0,
                                            customerId: customerId,
                                            userId: userId,
                                            frequencyType: AppString.oneTime,
                                            frequencyValue: AppString.empty,
                                            qty: cubit.quantity ?? 1,
                                            schedule: AppString.empty,
                                            dayWiseQuantity: 0,
                                            deliveryType: cubit.deliveryType,
                                            startDate: AppString.empty,
                                            endDate: AppString.empty,
                                            trialProduct: 0,
                                            noOfUsages: 0,
                                            productId: cubit.selectedVariant
                                                    ?.productId ??
                                                1,
                                          );
                                    },
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 10, vertical: 10),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 8.w),
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
