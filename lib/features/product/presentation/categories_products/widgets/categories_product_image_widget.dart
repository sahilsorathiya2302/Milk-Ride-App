import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';

class CategoriesProductImageWidget extends StatelessWidget {
  final String images;
  const CategoriesProductImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      child: CustomNetworkImages(
        src: images,
        height: 80.h,
        width: 80.w,
      ),
    );
  }
}
