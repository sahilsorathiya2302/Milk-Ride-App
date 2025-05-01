import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/banners.dart';

class BannerWidget extends StatefulWidget {
  final List<Banners> bannerState;
  const BannerWidget({super.key, required this.bannerState});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;

  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.bannerState.length,
          itemBuilder: (context, index, realIndex) {
            final banner = widget.bannerState[index];
            return CustomNetworkImages(src: banner.imageUrl ?? "");
          },
          options: CarouselOptions(
            height: 130.h,
            viewportFraction: 1.0,
            aspectRatio: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        10.height,
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: widget.bannerState.length,
          effect: SwapEffect(
            dotHeight: 7.h,
            dotWidth: 7.w,
            dotColor: AppColors.primaryLightColor,
            activeDotColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
