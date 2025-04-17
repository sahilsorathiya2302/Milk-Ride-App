import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmerPlaceHolder extends StatelessWidget {
  const CartShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.height,
            shimmerCartItem(),
            12.height,
            shimmerSectionTitle(),
            12.height,
            details(),
            12.height,
            details(),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }

  Widget shimmerSectionTitle() {
    return Row(
      children: [
        shimmerBox(
            height: 20.h,
            width: 90.w,
            borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
      ],
    );
  }

  Widget shimmerCartItem() {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerBox(
              height: 130.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
      ),
    );
  }

  Widget details() {
    return shimmerBox(
      height: 100,
      width: double.infinity,
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
