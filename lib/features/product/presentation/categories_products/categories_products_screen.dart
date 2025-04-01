import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/categories_product_info_widgets.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product/product_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product/product_state.dart';

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
    context.read<ProductCubit>().categoriesProduct(
        customerId: widget.getArgument[ArgumentKey.customerId],
        categoryId: widget.getArgument[ArgumentKey.categoryId]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(
          title: AppString.categoryProduct,
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadedState) {
              return CategoriesProductInfoWidgets(state: state);
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
