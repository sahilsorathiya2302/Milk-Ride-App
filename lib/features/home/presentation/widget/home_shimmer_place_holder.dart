import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerPlaceHolder extends StatelessWidget {
  const HomeShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            banner().paddingZero,
            12.height,
            indicatorRow(),
            24.height,
            shimmerSectionTitle(),
            12.height,
            shimmerCategoryRow(),
            24.height,
            shimmerSectionTitle(),
            12.height,
            shimmerProductRow(),
            12.height,
            banner(),
          ],
        ).paddingOnly(left: 15.w),
      ),
    );
  }

  Widget banner() {
    return shimmerBox(
      height: 120.h,
      width: double.infinity,
    );
  }

  Widget indicatorRow() {
    return SizedBox(
      height: 10.h,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: indicator(),
            );
          }),
        ),
      ),
    );
  }

  Widget indicator() {
    return shimmerBox(
        height: 10.h,
        width: 10.w,
        borderRadius: BorderRadius.circular(AppBorderRadius.r5));
  }

  Widget shimmerSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        shimmerBox(
            height: 20.h,
            width: 90.w,
            borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
        shimmerBox(
            height: 20.h,
            width: 50.w,
            borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
      ],
    );
  }

  Widget shimmerCategoryRow() {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => 12.width,
        itemBuilder: (context, index) => shimmerBox(
          height: 90.h,
          width: 80.w,
          borderRadius: BorderRadius.circular(AppBorderRadius.r10),
        ),
      ),
    );
  }

  Widget shimmerProductRow() {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerBox(
              height: 130.h,
              width: 120.w,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(height: 8),
            shimmerBox(
                height: 14,
                width: 80.w,
                borderRadius: BorderRadius.circular(4)),
            const SizedBox(height: 4),
            shimmerBox(
                height: 14,
                width: 60.w,
                borderRadius: BorderRadius.circular(4)),
          ],
        ),
      ),
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
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
