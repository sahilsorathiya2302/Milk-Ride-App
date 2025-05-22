import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SubscriptionShimmerPlaceHolder extends StatefulWidget {
  const SubscriptionShimmerPlaceHolder({super.key});

  @override
  State<SubscriptionShimmerPlaceHolder> createState() =>
      _SubscriptionShimmerPlaceHolderState();
}

class _SubscriptionShimmerPlaceHolderState
    extends State<SubscriptionShimmerPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 640.h,
            child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    banner().paddingSymmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  Widget banner() {
    return shimmerBox(
      height: 180.h,
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
