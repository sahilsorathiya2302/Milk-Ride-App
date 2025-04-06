import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/card_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/main_title_widget.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

class SeasonalWidget extends StatefulWidget {
  final List<ProductData>? state;
  const SeasonalWidget({super.key, this.state});

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
        10.height,
        CardWidget(state: widget.state ?? []),
      ],
    );
  }
}
