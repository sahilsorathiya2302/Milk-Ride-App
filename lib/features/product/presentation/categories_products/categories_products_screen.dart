import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_empty_screen.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/categories_product_info_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/categories_product_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_state.dart';

class CategoriesProductsScreen extends StatefulWidget {
  final dynamic getArgument;

  const CategoriesProductsScreen({
    super.key,
    required this.getArgument,
  });

  @override
  State<CategoriesProductsScreen> createState() =>
      _CategoriesProductsScreenState();
}

class _CategoriesProductsScreenState extends State<CategoriesProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesProductCubit>().categoriesProduct(
        customerId: widget.getArgument[ArgumentKey.customerId],
        categoryId: widget.getArgument[ArgumentKey.categoryId]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(
          title:
              "${widget.getArgument[ArgumentKey.appBarTitle] ?? widget.getArgument[ArgumentKey.categoriesName]} ${AppString.product}",
          icon: AppIcons.cart,
          onPressed: () {
            Get.toNamed(AppRoutesNames.cartScreen, arguments: {
              ArgumentKey.customerId: widget.getArgument[ArgumentKey.customerId]
            });
          },
        ),
        body: BlocBuilder<CategoriesProductCubit, CategoriesProductState>(
          builder: (context, state) {
            if (state is CategoriesProductLoading) {
              return CategoriesProductShimmerPlaceHolder();
            } else if (state is CategoriesProductError) {
              return NetworkFailCard(message: state.errorMessage);
            } else if (state is CategoriesProductLoaded) {
              return state.categoriesProductResponse.data!.isNotEmpty
                  ? CategoriesProductInfoWidget(
                      state: state.categoriesProductResponse.data ?? [],
                      configImages: widget.getArgument[ArgumentKey.configImage],
                      customerId: widget.getArgument[ArgumentKey.customerId])
                  : CustomEmptyScreen(
                      onPressed: () {},
                      text: AppString.productNotFound,
                      imagesPath: AppImagesKey.networkFail);
            } else {
              return Center(
                child: CategoriesProductShimmerPlaceHolder(),
              );
            }
          },
        ));
  }
}
