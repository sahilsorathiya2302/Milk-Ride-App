import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ViewProductCategoriesShimmerPlaceHolder extends StatefulWidget {
  const ViewProductCategoriesShimmerPlaceHolder({super.key});

  @override
  State<ViewProductCategoriesShimmerPlaceHolder> createState() =>
      _ViewProductCategoriesShimmerPlaceHolderState();
}

class _ViewProductCategoriesShimmerPlaceHolderState
    extends State<ViewProductCategoriesShimmerPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 16,
      itemBuilder: (context, index) {
        return Column(
          children: [
            shimmerBox(
              height: 60.h,
              width: 140.w,
              boxShape: BoxShape.circle,
            ),
            simpleText(
              width: 50.w,
            ),
          ],
        );
      },
    ).paddingSymmetric(horizontal: 12.w);
  }

  Widget simpleText({required double width}) {
    return shimmerBox(height: 10, width: width);
  }

  Widget shimmerBox({
    required double height,
    required double width,
    BoxShape? boxShape,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: boxShape ?? BoxShape.rectangle,
          color: Colors.white,
        ),
      ).paddingSymmetric(vertical: 5.h),
    );
  }
}
