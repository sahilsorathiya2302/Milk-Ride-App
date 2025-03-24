import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';

class CustomLogoImage extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomLogoImage({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImagesKey.logo,
        height: height ?? 200.h,
        width: width ?? 200.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
