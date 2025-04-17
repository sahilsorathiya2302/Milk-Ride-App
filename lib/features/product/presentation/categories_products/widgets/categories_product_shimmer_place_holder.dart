import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesProductShimmerPlaceHolder extends StatefulWidget {
  const CategoriesProductShimmerPlaceHolder({super.key});

  @override
  State<CategoriesProductShimmerPlaceHolder> createState() =>
      _CategoriesProductShimmerPlaceHolderState();
}

class _CategoriesProductShimmerPlaceHolderState
    extends State<CategoriesProductShimmerPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return shimmerBox(
          height: 120.h,
          width: 120.w,
          borderRadius: BorderRadius.circular(AppBorderRadius.r5),
        );
      },
    );
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
