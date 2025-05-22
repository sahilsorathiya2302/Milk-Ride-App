import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/variants/variants_screen.dart';

class FilterOptionWidget extends StatelessWidget {
  final int productId;
  final int customerId;
  final int packageId;

  const FilterOptionWidget({
    super.key,
    required this.productId,
    required this.customerId,
    required this.packageId,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.r2)),
          backgroundColor: AppColors.primaryLightColor,
          minimumSize: Size(80, 0),
          // Remove fixedSize property
        ),
        onPressed: () {
          variantSheet(
            packageId: packageId,
            context: context,
            productId: productId,
          );
        },
        child: SizedBox(
          height: 25.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppString.option,
                fontWeight: FontWeight.w700,
              ),
              Icon(AppIcons.arrowDropDown,
                  color: AppColors.black,
                  size: IconSize.i18) // Reduce icon size
            ],
          ),
        ));
  }
}
