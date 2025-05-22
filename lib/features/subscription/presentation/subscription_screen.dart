import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';

import '../../../core/routes/app_routes_names.dart';
import 'widgets/subscription_info.dart';

class SubscriptionScreen extends StatefulWidget {
  final void Function()? onBack;
  const SubscriptionScreen({super.key, this.onBack});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final userId = StorageManager.readData(StorageKeys.userId);
    context
        .read<SubscriptionCubit>()
        .mySubscription(customerId: customerId ?? 0, userId: userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
          title: AppString.mySubscription, leadingOnPressed: widget.onBack),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.offAllNamed(AppRoutesNames.mainScreen);
          }
        },
        child: Column(
          children: [
            SubscriptionInfo(),
          ],
        ),
      ),
    );
  }
}
