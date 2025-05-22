import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/billing_history/widgets/billing_history_widget.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/billing_history/widgets/billing_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/billing_history/billing_history_cubit.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/ui_component/custom_date_show.dart';
import '../../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../../core/ui_component/network_fail_card.dart';
import '../cubit/billing_history/billing_history_state.dart';

class BillingHistoryScreen extends StatefulWidget {
  const BillingHistoryScreen({super.key});

  @override
  State<BillingHistoryScreen> createState() => _BillingHistoryScreenState();
}

class _BillingHistoryScreenState extends State<BillingHistoryScreen> {
  @override
  void initState() {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    Get.context
        ?.read<BillingHistoryCubit>()
        .billingHistory(customerId: customerId);
    super.initState();
  }

  void _openRechargeHistoryDatePicker(BuildContext context) async {
    final billingHistoryCubit = context.read<BillingHistoryCubit>();

    final baseDate = billingHistoryCubit.state.selectDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: baseDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      billingHistoryCubit.setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingHistoryCubit, BillingHistoryState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.homeBG,
            appBar: CustomSimpleAppBar(
              title: AppString.billingHistory,
              icon: AppIcons.refresh,
              onPressed: () {
                final customerId =
                    StorageManager.readData(StorageKeys.customerId);
                context
                    .read<BillingHistoryCubit>()
                    .refreshBillingHistory(customerId);
              },
              widget: CustomDateShow(
                text: state.selectDate ?? DateTime.now(),
                onTap: () => _openRechargeHistoryDatePicker(context),
              ),
            ),
            body: _billingHistory(state));
      },
    );
  }

  Widget _billingHistory(BillingHistoryState state) {
    if (state is BillingHistoryLoading) {
      return BillingShimmerPlaceHolder();
    } else if (state is BillingHistoryError) {
      return NetworkFailCard(message: state.errorMessage);
    } else if (state is BillingHistoryLoaded) {
      return BillingHistoryWidget(
        billingHistoryData: state.billingHistoryResponse.data,
        selectedDate: state.selectDate,
      );
    }
    return BillingShimmerPlaceHolder();
  }
}
