import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImagesKey.logo,
    );
  }
}
