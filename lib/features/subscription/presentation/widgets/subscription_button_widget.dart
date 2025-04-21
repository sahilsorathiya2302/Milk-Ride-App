import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';

class SubscriptionButtonWidget extends StatefulWidget {
  final dynamic subscriptionArgument;

  const SubscriptionButtonWidget({super.key, this.subscriptionArgument});

  @override
  State<SubscriptionButtonWidget> createState() =>
      _SubscriptionButtonWidgetState();
}

final userId = StorageManager.readData(StorageKeys.userId);

class _SubscriptionButtonWidgetState extends State<SubscriptionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SubscriptionCubit>();

    return CustomButton(
        onPressed: () {
          if (cubit.state.deliverySchedule.isEmpty) {
            FunctionalComponent.errorMessageSnackbar(
                message: AppString.emptySchedule);
          } else if (cubit.state.deliverySchedule.isNotEmpty) {
            context.read<SubscriptionCubit>().subscriptionCreate(
                  packageId: widget.subscriptionArgument[ArgumentKey.packageId],
                  customerId:
                      widget.subscriptionArgument[ArgumentKey.customerId],
                  userId: userId,
                  frequencyType: cubit.state.frequencyType,
                  frequencyValue: cubit.state.frequencyValue.toString(),
                  qty: cubit.state.quantity,
                  schedule: cubit.state.deliverySchedule,
                  dayWiseQuantity: cubit.state.dayWiseQuantity,
                  deliveryType: cubit.state.deliveryType,
                  startDate: cubit.state.startDate,
                  endDate: cubit.state.endDate,
                  trialProduct: 0,
                  noOfUsages: 5,
                  productId: widget.subscriptionArgument[ArgumentKey.productId],
                );
          }
        },
        text: "${AppString.subscribe} ${AppString.now}");
  }
}
