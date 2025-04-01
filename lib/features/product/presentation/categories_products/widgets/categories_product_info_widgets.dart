import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/product_image_widget.dart';

import 'must_try_widget.dart';
import 'product_info_widget.dart';

class CategoriesProductInfoWidgets extends StatefulWidget {
  final dynamic state;
  const CategoriesProductInfoWidgets({super.key, required this.state});

  @override
  State<CategoriesProductInfoWidgets> createState() =>
      _CategoriesProductInfoWidgetsState();
}

class _CategoriesProductInfoWidgetsState
    extends State<CategoriesProductInfoWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.state.categoriesProductResponse.data.length,
            itemBuilder: (context, index) {
              final products =
                  widget.state.categoriesProductResponse.data ?? [];

              final categoriesProduct = products[index];

              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                  ),
                  child: Row(
                    children: [
                      ProductImageWidget(
                          images: categoriesProduct.imageUrl.toString()),
                      10.width,
                      ProductInfoWidget(
                        name: categoriesProduct.name.toString(),
                        brand: categoriesProduct.brand.toString(),
                        mrp: categoriesProduct.mrpPrice.toString(),
                        packageSize: categoriesProduct.packageSize.toString(),
                        sellMrp: categoriesProduct.salePrice.toString(),
                        volume: categoriesProduct.volume.toString(),
                      ),
                      const Spacer(),
                      categoriesProduct.mustTry == true
                          ? MustTryWidget()
                          : SizedBox(),
                    ],
                  ).paddingSymmetric(vertical: 10, horizontal: 15),
                ).paddingSymmetric(vertical: 5.h),
              );
            },
          ),
        ),
      ],
    );
  }
}
