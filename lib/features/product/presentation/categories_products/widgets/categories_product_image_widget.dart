import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';

class CategoriesProductImageWidget extends StatelessWidget {
  final String images;
  const CategoriesProductImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      child: Image.network(
        images,
        height: 90.h,
        width: 90.w,
        fit: BoxFit.cover,
        cacheWidth: null, // No caching
        cacheHeight: null,
      ),
    );
  }
}
