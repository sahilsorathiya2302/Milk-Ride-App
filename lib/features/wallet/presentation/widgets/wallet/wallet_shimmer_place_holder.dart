import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:shimmer/shimmer.dart';

class WalletShimmerPlaceHolder extends StatelessWidget {
  const WalletShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures shimmer is visible
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            12.height,
            balance().paddingOnly(left: 15.w, right: 15.w),
            12.height,
            Row(
              children: [
                containerBox(),
                10.width,
                containerBox(),
              ],
            ).paddingOnly(left: 15.w, right: 15.w),
            12.height,
            resentHistory(),
          ],
        )),
      ),
    );
  }

  Widget balance() {
    return shimmerBox(
      height: 200.h,
      width: double.infinity,
    );
  }

  Widget containerBox() {
    return shimmerBox(
      height: 80.h,
      width: 140.w,
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
  }) {
    return Shimmer.fromColors(
      baseColor: color ?? Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppBorderRadius.r8),
        ),
      ),
    );
  }
}
