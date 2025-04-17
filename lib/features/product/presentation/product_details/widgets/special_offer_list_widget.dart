import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';

class SpecialOfferListWidget extends StatefulWidget {
  final List<dynamic> packages;

  const SpecialOfferListWidget({
    super.key,
    required this.packages,
  });

  @override
  State<SpecialOfferListWidget> createState() => _SpecialOfferListWidgetState();
}

class _SpecialOfferListWidgetState extends State<SpecialOfferListWidget> {
  @override
  void initState() {
    super.initState();
  }

  final cubit = Get.context?.read<ProductDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        itemCount: widget.packages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final package = widget.packages[index];
          final isSelected = cubit?.selectedProduct == package;

          return GestureDetector(
            onTap: () {
              cubit?.selectVariant(variant: package);
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
              child: Container(
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppBorderRadius.r12),
                  border: isSelected
                      ? Border.all(color: AppColors.primaryColor, width: 1.5)
                      : Border.all(color: Colors.transparent),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppBorderRadius.r10),
                          topRight: Radius.circular(AppBorderRadius.r10),
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text:
                              "${package.percentageDifference.toStringAsFixed(0)}% OFF",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    5.height,
                    CustomText(
                      text: "${package.packageSize} ${package.volume}",
                      fontWeight: FontWeight.w700,
                      fontSize: AppTextSize.s12,
                    ),
                    2.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "₹${package.salePrice.toString()}",
                          fontWeight: FontWeight.w700,
                          fontSize: AppTextSize.s12,
                        ),
                        5.width,
                        CustomText(
                          text: AppString.rupeeSymbol +
                              package.mrpPrice.toString(),
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.lineThrough,
                          color: AppColors.grey,
                          fontSize: AppTextSize.s12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
