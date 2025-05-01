import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';

class SubscriptionProdInfoWidget extends StatelessWidget {
  final SubscriptionData productState;
  const SubscriptionProdInfoWidget({super.key, required this.productState});

  String getFormattedDayWiseQuantities(dynamic quantities) {
    if (quantities is String) {
      quantities = quantities
          .split(',')
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .toList();
    }

    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    List<String> result = [];

    for (int i = 0; i < quantities.length && i < days.length; i++) {
      if (quantities[i] > 0) {
        result.add("${days[i]}: ${quantities[i]}");
      }
    }
    return result.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomNetworkImages(
            height: 70.h,
            width: 70.w,
            src: productState.imageUrl ?? "",
          ),
        ),
        10.width,
        Expanded(
          // Wrap the following column in Expanded to prevent overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoText(
                text: productState.productName ?? AppString.empty,
              ),
              buildInfoText(
                textSize: AppTextSize.s11,
                text: "${productState.packageSize}${productState.volume}",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildInfoText(
                      textSize: AppTextSize.s11,
                      text:
                          "${double.parse(productState.salePrice ?? '0').toStringAsFixed(0)} x ${productState.frequencyType == AppString.dayWiseSub ? "[${getFormattedDayWiseQuantities(productState.dayWiseQuantity)}]" : productState.qty}",
                    ),
                  ),
                  buildInfoText(
                    text:
                        "${AppString.rupeeSymbol}${double.parse(productState.totalSalePrice ?? '0').toStringAsFixed(0)}",
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 10.w);
  }

  CustomText buildInfoText(
      {required String text, Color? color, double? textSize}) {
    return CustomText(
      maxLine: 2,
      text: text,
      color: color ?? AppColors.darkGrey,
      fontSize: textSize ?? AppTextSize.s13,
      fontWeight: FontWeight.w600,
    );
  }
}
