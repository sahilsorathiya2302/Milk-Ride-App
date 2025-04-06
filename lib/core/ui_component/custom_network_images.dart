import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';

class CustomNetworkImages extends StatelessWidget {
  final String src;
  final BoxFit? fit;
  final double? height;
  final double? width;
  const CustomNetworkImages(
      {super.key, required this.src, this.fit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
            child: Container(
          height: height,
          width: width,
          color: AppColors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ));
      },
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: Icon(Icons.broken_image,
              size: 50, color: Colors.grey), // Placeholder icon
        );
      },
    );
  }
}
