import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmerPlaceHolder extends StatefulWidget {
  const ProductDetailsShimmerPlaceHolder({super.key});

  @override
  State<ProductDetailsShimmerPlaceHolder> createState() =>
      _ProductDetailsShimmerPlaceHolderState();
}

class _ProductDetailsShimmerPlaceHolderState
    extends State<ProductDetailsShimmerPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageBox(),
        recommendedRow(),
        simpleText(width: 120),
        simpleText(width: 180),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  shimmerBox(
                    height: 80.h,
                    width: 120.w,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                  ),
                ],
              ).paddingOnly(right: 10);
            },
          ),
        ),
        simpleText(width: 120),
        simpleText(width: 220),
        simpleText(width: double.infinity),
        divider(),
        button()
      ],
    ).paddingSymmetric(horizontal: 12.w, vertical: 10.h);
  }

  Widget imageBox() {
    return shimmerBox(height: 330.h, width: double.infinity);
  }

  Widget divider() {
    return shimmerBox(height: 3.h, width: double.infinity);
  }

  Widget button() {
    return shimmerBox(height: 55.h, width: double.infinity);
  }

  Widget recommendedRow() {
    return Row(
      children: List.generate(
        2,
        (index) {
          return shimmerBox(
                  height: 30.h,
                  width: 80.w,
                  borderRadius: BorderRadius.circular(AppBorderRadius.r5))
              .paddingOnly(right: 10);
        },
      ),
    );
  }

  Widget simpleText({required double width}) {
    return shimmerBox(
        height: 20,
        width: width,
        borderRadius: BorderRadius.circular(AppBorderRadius.r5));
  }

  Widget shimmerBox({
    required double height,
    required double width,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ).paddingSymmetric(vertical: 5.h),
    );
  }
}
