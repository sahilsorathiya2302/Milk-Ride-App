import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/new_arrival.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/card_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/main_title_widget.dart';

class NewArrivalInfoWidget extends StatefulWidget {
  final List<NewArrival>? state;
  const NewArrivalInfoWidget({super.key, this.state});

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
        10.height,
        CardWidget(state: widget.state!.toList()),
      ],
    );
  }
}
