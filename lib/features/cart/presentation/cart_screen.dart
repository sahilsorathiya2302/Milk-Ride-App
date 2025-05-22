import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_empty_screen.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/delivery_address_widgets.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/payable_amount_widget.dart';

import 'cubit/cart/cart_state.dart';
import 'widgets/cart_shimmer_place_holder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final customerId = StorageManager.readData(StorageKeys.customerId);

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().addToCart(customerId: customerId ?? 0);
    super.initState();
  }

  late int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Get.back();
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.homeBG,
          appBar: CustomSimpleAppBar(
            title: AppString.myCart,
            // leadingOnPressed: () {
            //   Get.back();
            // },
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return CartShimmerPlaceHolder();
              } else if (state is CartErrorState) {
                return NetworkFailCard(message: state.errorMessage);
              } else if (state is CartLoadedState) {
                return (state.cartResponse.data?.package?.isNotEmpty ?? false)
                    ? Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CartItemWidget(
                                    packageState:
                                        state.cartResponse.data?.package ?? [],
                                  ),
                                  10.height,
                                  DeliveryAddressWidgets(
                                    deliveryState: state.cartResponse.data
                                            ?.deliveryDetails ??
                                        "",
                                  ),
                                  20.height,
                                ],
                              ),
                            ).paddingSymmetric(
                                vertical: 10.h, horizontal: 15.w),
                          ),
                          PayableAmountWidget(
                            customerId: customerId ?? 0,
                          )
                        ],
                      )
                    : CustomEmptyScreen(
                        onPressed: () {
                          Get.offAllNamed(AppRoutesNames.mainScreen);
                        },
                        buttonText: AppString.orderNow,
                        text: AppString.cartEmpty,
                        imagesPath: AppImagesKey.cartEmpty);
              }
              return CartShimmerPlaceHolder();
            },
          )),
    );
  }
}
