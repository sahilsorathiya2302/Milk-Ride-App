import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories/view_all_prod_categories_main_widget.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/widgets/categories_products/category_products_main_widget.dart';

import '../../../core/constants/app_string.dart';

class ViewAllProductShowScreen extends StatelessWidget {
  final void Function()? onBack;
  const ViewAllProductShowScreen({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) onBack;
      },
      child: Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(
          title: AppString.allProduct,
          leadingOnPressed: onBack,
          icon: AppIcons.cart,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ViewAllProdCategoriesMainWidget(),
            CategoryProductsMainWidget(),
          ],
        ),
      ),
    );
  }
}
