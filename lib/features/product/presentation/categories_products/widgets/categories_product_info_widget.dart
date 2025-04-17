import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/utils/list_utils.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/categories_product_image_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/filter_option_widget.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/recommended_product_widget.dart';

import 'category_product_details_widget.dart';

class CategoriesProductInfoWidget extends StatefulWidget {
  final List<ProductData> state;
  final String configImages;
  final int customerId;

  const CategoriesProductInfoWidget({
    super.key,
    required this.state,
    required this.customerId,
    required this.configImages,
  });

  @override
  State<CategoriesProductInfoWidget> createState() =>
      _CategoriesProductInfoWidgetsState();
}

class _CategoriesProductInfoWidgetsState
    extends State<CategoriesProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final uniqueProducts = ListUtils.getUniqueProductsByProductId(widget.state);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: uniqueProducts.length,
            itemBuilder: (context, index) {
              final categoriesProduct = uniqueProducts[index];

              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutesNames.productDetails, arguments: {
                    ArgumentKey.customerId: widget.customerId,
                    ArgumentKey.productId: categoriesProduct.productId,
                    ArgumentKey.packageId: categoriesProduct.id,
                  });
                },
                child: Container(
                  height: 110.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                  ),
                  child: Row(
                    children: [
                      CategoriesProductImageWidget(
                          images: categoriesProduct.imageUrl ??
                              widget.configImages),
                      10.width,
                      CategoryProductDetailsWidget(
                        name: categoriesProduct.name.toString(),
                        brand: categoriesProduct.brand.toString(),
                        mrp: categoriesProduct.mrpPrice.toString(),
                        packageSize: categoriesProduct.packageSize.toString(),
                        sellMrp: categoriesProduct.salePrice.toString(),
                        volume: categoriesProduct.volume.toString(),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          categoriesProduct.mustTry == true
                              ? RecommendedProductWidget()
                              : SizedBox(),
                          Spacer(),
                          FilterOptionWidget(
                            packageId: categoriesProduct.id ?? 0,
                            customerId: widget.customerId,
                            productId: categoriesProduct.productId ?? 0,
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10.h, horizontal: 15.w),
                ).paddingSymmetric(vertical: 5.h),
              );
            },
          ),
        ),
      ],
    );
  }
}
