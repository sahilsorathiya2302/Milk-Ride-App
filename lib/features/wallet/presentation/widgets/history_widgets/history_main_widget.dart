import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_history.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/history_widgets/history_button_widget.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/history_widgets/recent_history_widget.dart';

class HistoryMainWidget extends StatefulWidget {
  final List<WalletHistory> walletHistoryState;
  const HistoryMainWidget({super.key, required this.walletHistoryState});

  @override
  State<HistoryMainWidget> createState() => _HistoryMainWidgetState();
}

class _HistoryMainWidgetState extends State<HistoryMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HistoryButtonWidget(),
        10.height,
        RecentHistoryWidget(
          walletHistory: widget.walletHistoryState,
        ),
        20.height,
      ],
    );
  }
}
