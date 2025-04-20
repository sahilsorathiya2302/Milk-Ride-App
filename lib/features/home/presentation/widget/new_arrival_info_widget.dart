import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

import 'card_widget.dart';
import 'main_title_widget.dart';

class NewArrivalInfoWidget extends StatefulWidget {
  final List<ProductData>? state;
  final int customerId;
  const NewArrivalInfoWidget({super.key, this.state, required this.customerId});

  @override
  State<NewArrivalInfoWidget> createState() => _NewArrivalInfoWidgetState();
}

class _NewArrivalInfoWidgetState extends State<NewArrivalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: AppString.newArrival),
        CardWidget(
          state: widget.state ?? [],
          customerId: widget.customerId,
        ),
      ],
    ).paddingZero;
  }
}
