import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';

class ProductImageWidget extends StatelessWidget {
  final String images;
  const ProductImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      child: Image.network(
        images,
        height: 90,
        width: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
