import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/recharge_history/recharge_history_state.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/recharge_history/widgets/recharge_history_info_widget.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/recharge_history/widgets/recharge_shimmer_place_holder.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/ui_component/custom_date_show.dart';
import '../../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../../core/ui_component/network_fail_card.dart';

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

  void _openRechargeHistoryDatePicker(BuildContext context) async {
    final rechargeHistoryCubit = context.read<RechargeHistoryCubit>();

    final baseDate = rechargeHistoryCubit.state.selectDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: baseDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      rechargeHistoryCubit.setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RechargeHistoryCubit, RechargeHistoryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.homeBG,
          appBar: CustomSimpleAppBar(
              title: AppString.rechargeHistory,
              icon: AppIcons.refresh,
              onPressed: () {
                final customerId =
                    StorageManager.readData(StorageKeys.customerId);
                context
                    .read<RechargeHistoryCubit>()
                    .refreshRechargeHistory(customerId);
              },
              widget: CustomDateShow(
                text: state.selectDate ?? DateTime.now(),
                onTap: () => _openRechargeHistoryDatePicker(context),
              )),
          body: _rechargeHistoryBody(state),
        );
      },
    );
  }

  Widget _rechargeHistoryBody(RechargeHistoryState state) {
    if (state is RechargeHistoryLoading) {
      return RechargeShimmerPlaceHolder();
    } else if (state is RechargeHistoryError) {
      return NetworkFailCard(message: state.errorMessage);
    } else if (state is RechargeHistoryLoaded) {
      return RechargeHistoryInfoWidget(
        rechargeHistoryData: state.rechargeHistoryResponse.data,
        selectedDate: state.selectDate,
      );
    }
    return RechargeShimmerPlaceHolder();
  }
}
