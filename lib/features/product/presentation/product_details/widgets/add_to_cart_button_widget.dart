import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final int selaPrice;
  final int quantity;
  const AddToCartButtonWidget(
      {super.key, required this.selaPrice, required this.quantity});

  @override
  Widget build(BuildContext context) {
    print(quantity);
    print(selaPrice);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLightColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
                fixedSize: Size(
                  340.w,
                  60.h,
                )),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "${AppString.rupeeSymbol}${selaPrice * quantity}",
                      fontSize: AppTextSize.s14,
                      fontWeight: FontWeight.w700,
                    ),
                    10.width,
                    CustomText(
                      text: AppString.totalAmount,
                      color: AppColors.darkGrey,
                      fontSize: AppTextSize.s14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                CustomText(
                  text: AppString.addToCart,
                  fontSize: AppTextSize.s14,
                  fontWeight: FontWeight.w700,
                ),
              ],
            )),
        Container(
          height: 8.h,
          color: AppColors.homeBG,
        )
      ],
    );
  }
}
