import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/add_to_cart_button_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/delivery_type_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/musty_try_egg_less_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/product_info_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/products_image_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/quantity_selector_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/widgets/special_offer_list_widget.dart';

import '../../../../core/constants/argument_key.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../../core/ui_component/custom_text.dart';
import '../categories_products/widgets/purchase_for_widget.dart';
import '../cubit/product_details/product_details_cubit.dart';
import '../cubit/product_details/product_details_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic getArgument;
  const ProductDetailsScreen({super.key, required this.getArgument});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final ProductDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProductDetailsCubit>();
    cubit.product(
      customerId: widget.getArgument[ArgumentKey.customerId],
      productId: widget.getArgument[ArgumentKey.productId],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
        title: AppString.productDetails,
        icon: AppIcons.cart,
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsLoaded) {
            final information = state.filteredPackages?[0];

            return Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductsImageWidget(
                          images: information?.imageUrl.toString() ?? "",
                        ),
                        5.height,
                        MustyTryEggLessWidget(
                          isMustTry: information?.mustTry ?? false,
                          isEggLess: information?.isEggless ?? false,
                        ),
                        5.height,
                        ProductInfoWidget(
                          brandName: information?.brand.toString() ?? "",
                          foodType: information?.foodType.toString() ?? "",
                          productName: information?.name.toString() ?? "",
                        ),
                        5.height,
                        SpecialOfferListWidget(
                          packages:
                              state.productResponse.data?.filteredPackages ??
                                  [],
                          onPackageSelected: (value) {
                            cubit.updatePrice(value);
                          },
                          onResetQuantity: (qty) {
                            cubit.updateQuantity(qty);
                          },
                        ),
                        10.height,
                        QuantitySelectorWidget(
                          initialQuantity: cubit.selectedQuantity,
                          minQuantity: information?.minQtyAllow ?? 1,
                          maxQuantity: information?.maxQtyAllow ?? 50,
                          onQuantityChanged: (value) {
                            cubit.updateQuantity(value);
                          },
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
                        PurchaseForWidget(),
                        80.height,
                      ],
                    ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AddToCartButtonWidget(
                    selaPrice: cubit.selectedPrice.toInt(),
                    quantity: cubit.selectedQuantity,
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
