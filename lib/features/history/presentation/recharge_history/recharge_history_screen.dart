import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/recharge_history/recharge_history_state.dart';
import 'package:milk_ride_live_wc/features/history/presentation/recharge_history/widgets/recharge_history_info_widget.dart';
import 'package:milk_ride_live_wc/features/history/presentation/recharge_history/widgets/recharge_shimmer_place_holder.dart';

class RechargeHistoryScreen extends StatefulWidget {
  const RechargeHistoryScreen({super.key});

  @override
  State<RechargeHistoryScreen> createState() => _RechargeHistoryScreenState();
}

class _RechargeHistoryScreenState extends State<RechargeHistoryScreen> {
  @override
  void initState() {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    context
        .read<RechargeHistoryCubit>()
        .rechargeHistory(customerId: customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
        title: AppString.rechargeHistory,
        icon: AppIcons.calendar,
      ),
      body: BlocBuilder<RechargeHistoryCubit, RechargeHistoryState>(
        builder: (context, state) {
          if (state is RechargeHistoryLoading) {
            return RechargeShimmerPlaceHolder();
          } else if (state is RechargeHistoryError) {
            return NetworkFailCard(message: state.errorMessage);
          } else if (state is RechargeHistoryLoaded) {
            return RechargeHistoryInfoWidget(
              rechargeHistoryData: state.rechargeHistoryResponse.data,
            );
          }
          return RechargeShimmerPlaceHolder();
        },
      ),
    );
  }
}
