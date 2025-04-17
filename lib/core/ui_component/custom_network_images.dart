import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';

class CustomNetworkImages extends StatelessWidget {
  final String src;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const CustomNetworkImages({
    super.key,
    required this.src,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: src,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => SizedBox(
        height: height,
        width: width,
        child: const Center(
          child: SizedBox(
            height: 20, // smaller spinner height
            width: 20, // smaller spinner width
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Image.asset(
            AppImagesKey.networkFail,
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
