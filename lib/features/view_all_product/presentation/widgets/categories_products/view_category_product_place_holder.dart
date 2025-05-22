import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:shimmer/shimmer.dart';

class ViewCategoryProductPlaceHolder extends StatelessWidget {
  const ViewCategoryProductPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // prevents conflict with parent scroll
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return shimmerBox(
          height: 120.h,
          width: 120.w,
          borderRadius: BorderRadius.circular(AppBorderRadius.r10),
        ).paddingSymmetric(vertical: 10, horizontal: 10);
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
      ),
    );
  }
}
