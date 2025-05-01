import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_custom_button.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/ui_component/custom_dialog_box.dart';
import '../../domain/entities/subscription_data.dart';
import '../cubit/subscription/subscription_cubit.dart';

class DeleteButton extends StatefulWidget {
  final SubscriptionData state;
  const DeleteButton({super.key, required this.state});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return SubscriptionCustomButton(
      title: AppString.delete,
      icon: AppIcons.delete,
      onTap: () {
        showConfirmationDialog(
          onPressed: () {
            final customerId = StorageManager.readData(StorageKeys.customerId);
            final userId = StorageManager.readData(StorageKeys.userId);
            context.read<SubscriptionCubit>().deleteSubscription(
                subscriptionId: widget.state.id ?? 0,
                customerId: customerId ?? 0,
                userId: userId);
            Get.back();
          },
          title: AppString.subDelete,
          subTitle: AppString.subDeleteMessage,
        );
      },
    );
  }
}
