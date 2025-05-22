import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePlaceHolderShimmer extends StatelessWidget {
  const ProfilePlaceHolderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.height,
          Center(child: top()),
          20.height,
          Row(
            children: [
              circle(),
              20.width,
              Expanded(child: text()),
            ],
          ),
          10.height,
          containerBox(),
          10.height,
          containerBox(),
          10.height,
          text(),
          10.height,
          containerBox(),
          10.height,
          text(),
          10.height,
          containerBox(),
          10.height,
          containerBox(),
          10.height,
          containerBox(),
          10.height,
        ],
      ),
    );
  }

  Widget top() {
    return shimmerBox(
        height: 7.h, width: 100.w, borderRadius: BorderRadius.circular(10));
  }

  Widget circle() {
    return shimmerBox(
        height: 40.h, width: 40.w, borderRadius: BorderRadius.circular(40));
  }

  Widget text() {
    return shimmerBox(
      height: 30.h,
      width: 120.w,
    );
  }

  Widget containerBox() {
    return shimmerBox(
      height: 60,
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
          color: color ?? AppColors.white,
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
