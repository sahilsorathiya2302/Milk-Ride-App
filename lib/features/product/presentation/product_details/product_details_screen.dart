import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_state.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/add_to_cart_button_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/delivery_type_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/musty_try_egg_less_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/product_details_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/product_info_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/products_image_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/special_offer_list_widget.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/constants/argument_key.dart';
import '../../../../core/routes/app_routes_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_quantity_sector.dart';
import '../../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../../core/ui_component/custom_text.dart';
import '../../../../core/ui_component/network_fail_card.dart';
import '../categories_products/widgets/purchase_for_widget.dart';
import '../cubit/product_details/product_details_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic getArgument;
  const ProductDetailsScreen({super.key, required this.getArgument});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    super.initState();
    context.read<ProductDetailsCubit>().productDetails(
          customerId: customerId,
          productId: widget.getArgument[ArgumentKey.productId],
        );
  }

  final userId = StorageManager.readData(StorageKeys.userId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: AppColors.homeBG,
          appBar: CustomSimpleAppBar(
            title: AppString.productDetails,
            icon: AppIcons.cart,
            // cartQty: context.read<HomeCubit>().homeData?.cartQty.toString(),
            onPressed: () {
              Get.toNamed(AppRoutesNames.cartScreen);
            },
          ),
          body: _productDetailsBody(state),
        );
      },
    );
  }

  Widget _productDetailsBody(ProductDetailsState state) {
    final cubit = context.read<ProductDetailsCubit>();

    if (state is ProductDetailsLoading) {
      return const Center(
          child: Center(child: ProductDetailsShimmerPlaceHolder()));
    } else if (state is ProductDetailsError) {
      return NetworkFailCard(message: state.failure);
    } else if (state is ProductDetailsLoaded) {
      final selected = state.selectedVariant;
      if (selected == null) {
        return const Center(child: Text("No variant selected"));
      }
      return RefreshIndicator(
        onRefresh: () async {
          final customerId = StorageManager.readData(StorageKeys.customerId);
          context.read<ProductDetailsCubit>().productDetails(
                customerId: customerId,
                productId: widget.getArgument[ArgumentKey.productId],
              );
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductsImageWidget(
                      images: selected.imageUrl ?? AppString.empty,
                    ),
                    15.height,
                    MustyTryEggLessWidget(
                      isMustTry: selected.mustTry ?? false,
                      isEggLess: selected.isEggless ?? false,
                    ),
                    10.height,
                    ProductInfoWidget(
                      brandName: selected.brand.toString(),
                      foodType: selected.foodType.toString(),
                      productName: selected.name.toString(),
                    ),
                    8.height,
                    SpecialOfferListWidget(
                      packages:
                          state.productResponse.data?.filteredPackages ?? [],
                    ),
                    10.height,
                    CustomQuantitySector(
                      quantity: cubit.quantity.toString(),
                      minQuantity: selected.minQtyAllow ?? 1,
                      maxQuantity: selected.maxQtyAllow ?? 50,
                      addOnPressed: () => cubit.incrementQty(),
                      removeOnPressed: () => cubit.decrementQty(),
                    ),
                    5.height,
                    CustomText(
                      text: AppString.texes,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    5.height,
                    DeliveryTypeWidget(
                      eveningMessage:
                          state.productResponse.data?.eveningCutoff ?? "",
                      morningMessage:
                          state.productResponse.data?.morningCutoff ?? "",
                    ),
                    10.height,
                    CustomText(
                      text: AppString.purchaseFor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppTextSize.s14,
                    ),
                    PurchaseForWidget(
                      subscribeOnPressed: () {
                        Get.toNamed(
                          AppRoutesNames.createSubscriptionScreen,
                          arguments: {
                            ArgumentKey.customerId:
                                widget.getArgument[ArgumentKey.customerId],
                            ArgumentKey.productId:
                                cubit.selectedProduct?.productId,
                            ArgumentKey.packageId: cubit.selectedProduct?.id,
                            ArgumentKey.productName:
                                cubit.selectedProduct?.name,
                            ArgumentKey.productImage:
                                cubit.selectedProduct?.imageUrl,
                            ArgumentKey.volume: cubit.selectedProduct?.volume,
                            ArgumentKey.productPackegeSize:
                                cubit.selectedProduct?.packageSize,
                            ArgumentKey.salePrice:
                                cubit.selectedProduct?.salePrice,
                            ArgumentKey.mrpPrice:
                                cubit.selectedProduct?.mrpPrice,
                            ArgumentKey.selectQuantity: cubit.quantity,
                            ArgumentKey.deliveryType: cubit.deliveryType,
                          },
                        );
                      },
                      onPressed: () {},
                      height: 8.h,
                      width: 110.w,
                      textSize: AppTextSize.s12,
                    ),
                    80.height,
                  ],
                ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AddToCartButtonWidget(
                userId: userId,
                // customerId: StorageManager.readData(StorageKeys.customerId),
                quantity: cubit.quantity,
              ),
            ).paddingSymmetric(horizontal: 10.w)
          ],
        ),
      );
    }
    return const Center(child: ProductDetailsShimmerPlaceHolder());
  }
}
