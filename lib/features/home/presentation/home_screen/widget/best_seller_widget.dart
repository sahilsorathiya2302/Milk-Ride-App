import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/best_seller.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/card_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/main_title_widget.dart';

class BestSellerWidget extends StatefulWidget {
  final List<BestSeller>? state;
  const BestSellerWidget({super.key, this.state});

  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: AppString.bestSeller),
        10.height,
        CardWidget(state: widget.state!.toList()),
      ],
    );
  }
}
