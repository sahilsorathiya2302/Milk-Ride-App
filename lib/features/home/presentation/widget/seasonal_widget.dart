import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/card_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/main_title_widget.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

class SeasonalWidget extends StatefulWidget {
  final List<ProductData>? state;
  final int customerId;
  const SeasonalWidget({super.key, this.state, required this.customerId});

  @override
  State<SeasonalWidget> createState() => _SeasonalWidgetState();
}

class _SeasonalWidgetState extends State<SeasonalWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: AppString.seasonal),
        CardWidget(
          state: widget.state ?? [],
          customerId: widget.customerId,
        ),
      ],
    );
  }
}
