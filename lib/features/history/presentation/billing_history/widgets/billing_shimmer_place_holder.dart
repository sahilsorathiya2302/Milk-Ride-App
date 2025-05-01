import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class BillingShimmerPlaceHolder extends StatelessWidget {
  const BillingShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          12.height,
          date(),
          12.height,
          information(),
          12.height,
          date(),
          12.height,
          information(),
        ],
      ),
    );
  }

  Widget date() {
    return shimmerBox(
      height: 30.h,
      width: double.infinity,
    );
  }

  Widget information() {
    return shimmerBox(
      height: 120,
      width: double.infinity,
    );
  }

  Widget resentHistory() {
    return shimmerBox(
        height: 500, width: double.infinity, borderRadius: BorderRadius.zero);
  }

  Widget shimmerBox({
    required double height,
    required double width,
    BorderRadius? borderRadius,
    Color? color,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: color ?? Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: child != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              )
            : null,
      ),
    );
  }
}
