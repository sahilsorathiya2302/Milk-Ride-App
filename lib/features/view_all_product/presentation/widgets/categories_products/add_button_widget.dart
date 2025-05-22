import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/variants/variants_screen.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_all_product_packages.dart';

class AddButtonWidget extends StatelessWidget {
  final ViewAllProductPackages product;
  const AddButtonWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        variantSheet(
          context: context,
          productId: product.productId ?? 0,
          packageId: product.id ?? 0,
        );
      },
      child: Container(
        height: 20.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: AppString.add,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s10,
            ),
            Icon(
              AppIcons.add,
              size: IconSize.i15,
            ),
          ],
        ),
      ),
    );
  }
}
