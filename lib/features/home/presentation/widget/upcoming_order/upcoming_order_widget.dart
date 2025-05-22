import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';

class UpcomingOrderWidget extends StatefulWidget {
  const UpcomingOrderWidget({super.key});

  @override
  State<UpcomingOrderWidget> createState() => _UpcomingOrderWidgetState();
}

class _UpcomingOrderWidgetState extends State<UpcomingOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(color: AppColors.white),
        );
      },
    );
  }
}
