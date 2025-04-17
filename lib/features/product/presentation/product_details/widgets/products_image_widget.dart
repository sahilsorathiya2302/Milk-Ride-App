import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';

class ProductsImageWidget extends StatelessWidget {
  final String images;
  const ProductsImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.r15),
      child: CustomNetworkImages(
        src: images,
        height: 330.h,
        width: context.width,
      ),
    );
  }
}
