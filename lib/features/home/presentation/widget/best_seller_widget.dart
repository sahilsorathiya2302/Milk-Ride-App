import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

import 'card_widget.dart';
import 'main_title_widget.dart';

class BestSellerWidget extends StatefulWidget {
  final int customerId;
  final List<ProductData>? state;
  const BestSellerWidget({super.key, this.state, required this.customerId});

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
        CardWidget(
          state: widget.state ?? [],
          customerId: widget.customerId,
        ),
      ],
    );
  }
}
