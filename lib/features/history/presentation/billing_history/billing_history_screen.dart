import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/history/presentation/billing_history/widgets/billing_history_widget.dart';
import 'package:milk_ride_live_wc/features/history/presentation/billing_history/widgets/billing_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/billing_history/billing_history_cubit.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/billing_history/billing_history_state.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(title: AppString.billingHistory),
        body: BlocBuilder<BillingHistoryCubit, BillingHistoryState>(
          builder: (context, state) {
            if (state is BillingHistoryLoading) {
              return BillingShimmerPlaceHolder();
            } else if (state is BillingHistoryError) {
              return NetworkFailCard(message: state.errorMessage);
            } else if (state is BillingHistoryLoaded) {
              return BillingHistoryWidget(
                billingHistoryData: state.billingHistoryResponse.data,
              );
            }
            return BillingShimmerPlaceHolder();
          },
        ));
  }
}
