import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/widgets/product_details_sheet.dart';

class FilterOptionWidget extends StatelessWidget {
  final int productId;
  final int customerId;
  const FilterOptionWidget({
    super.key,
    required this.productId,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: AppColors.primaryLightColor,
          minimumSize: Size(80, 0),
          // Remove fixedSize property
        ),
        onPressed: () {
          productDetailsSheet(
              context: context, productId: productId, customerId: customerId);
        },
        child: SizedBox(
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppString.option,
                fontWeight: FontWeight.w700,
              ),
              Icon(AppIcons.arrowDropDown,
                  size: IconSize.i18) // Reduce icon size
            ],
          ),
        ));
  }
}
