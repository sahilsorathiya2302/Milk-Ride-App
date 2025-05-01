import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories/widgets/categories_into_widget.dart';

class ViewCategoriesScreen extends StatefulWidget {
  final dynamic getArgument;
  const ViewCategoriesScreen({super.key, required this.getArgument});

  @override
  State<ViewCategoriesScreen> createState() => _ViewCategoriesScreenState();
}

class _ViewCategoriesScreenState extends State<ViewCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
        title: AppString.allCategories,
      ),
      body: Column(
        children: [
          Expanded(
            child: CategoriesIntoWidget(
              customerId: widget.getArgument[ArgumentKey.customerId],
              configImage: widget.getArgument[ArgumentKey.configImage],
            ),
          ),
        ],
      ),
    );
  }
}
