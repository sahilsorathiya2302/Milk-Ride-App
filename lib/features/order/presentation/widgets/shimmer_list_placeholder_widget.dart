import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListPlaceholderWidget extends StatelessWidget {
  const ShimmerListPlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return dateCard().paddingOnly(right: 16.h);
              },
            ),
          ),
          24.height,
          status(),
          24.height,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return shimmerCard().paddingOnly(bottom: 16.h);
            },
          ),
        ],
      ),
    ).paddingAll(16);
  }

  Widget dateCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.r5),
        ),
      ),
    );
  }

  Widget status() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 30.h,
        width: Get.context!.width * 0.88,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.r5),
        ),
      ),
    );
  }

  Widget shimmerCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.r12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerBox(
            height: 90.h,
            width: Get.context!.width * 0.88,
            borderRadius: BorderRadius.circular(AppBorderRadius.r5),
          ),
        ],
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
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppBorderRadius.r8),
        ),
      ),
    );
  }
}
