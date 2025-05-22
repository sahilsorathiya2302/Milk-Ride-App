import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';

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
    final cubit = context.read<CreateSubscriptionCubit>();

    return CustomButton(
      onPressed: () {
        final deliverySchedule = cubit.state.deliverySchedule;
        final dayQuantities = cubit.state.dayQuantities;

        print("===============>$deliverySchedule");
        print("================>$dayQuantities");
        if (deliverySchedule.isEmpty) {
          FunctionalComponent.errorMessageSnackbar(
              message: AppString.emptySchedule);
          return;
        }

        final listEquals = const ListEquality().equals;

        if (deliverySchedule == AppString.dayWiseSub1 &&
            listEquals(dayQuantities, [0, 0, 0, 0, 0, 0, 0])) {
          FunctionalComponent.errorMessageSnackbar(
            message: AppString.dayWiseQty,
          );
          return;
        }

        final quantityJson = jsonEncode(dayQuantities);

        cubit.subscriptionCreate(
          packageId: widget.subscriptionArgument[ArgumentKey.packageId],
          customerId: widget.subscriptionArgument[ArgumentKey.customerId],
          userId: userId,
          frequencyType: cubit.state.frequencyType,
          frequencyValue: cubit.state.frequencyValue.toString(),
          qty: cubit.state.frequencyType == AppString.dayWiseSub
              ? 0
              : cubit.state.quantity,
          schedule: deliverySchedule,
          dayWiseQuantity: quantityJson,
          deliveryType: cubit.state.deliveryType,
          startDate: cubit.state.startDate,
          endDate: cubit.state.endDate,
          trialProduct: 0,
          noOfUsages: 5,
          productId: widget.subscriptionArgument[ArgumentKey.productId],
        );

        Get.toNamed(
          AppRoutesNames.mainScreen,
          arguments: {ArgumentKey.selectedIndex: 3},
        );
      },
      text: "${AppString.subscribe} ${AppString.now}",
    );
  }
}
