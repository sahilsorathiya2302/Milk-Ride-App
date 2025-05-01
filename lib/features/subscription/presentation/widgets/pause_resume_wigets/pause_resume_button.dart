import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_custom_button.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/storage/storage_keys.dart';
import '../../../../../core/storage/storage_manager.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/ui_component/custom_button.dart';
import '../../../../../core/ui_component/custom_dialog_box.dart';
import '../../cubit/pause_resume_cubit/pause_resume_sub_cubit.dart';
import '../../cubit/pause_resume_cubit/pause_resume_sub_state.dart';
import 'date_widget.dart';

class PauseResumeButton extends StatefulWidget {
  final SubscriptionData state;
  const PauseResumeButton({super.key, required this.state});

  @override
  State<PauseResumeButton> createState() => _PauseResumeButtonState();
}

class _PauseResumeButtonState extends State<PauseResumeButton> {
  @override
  Widget build(BuildContext context) {
    return widget.state.pauseSubscription == null
        ? SubscriptionCustomButton(
            title: AppString.pause,
            icon: AppIcons.pause,
            onTap: () {
              showConfirmationDialog(
                title: AppString.pauseSubscription,
                subTitle: AppString.subModifyMessage,
                widget: Column(
                  children: [
                    DateWidget(
                      startDate: widget.state.startDate ?? "",
                      endDate: widget.state.endDate ?? "",
                    ),
                    10.height,
                    BlocBuilder<PauseResumeSubCubit, PauseResumeSubState>(
                      builder: (context, state) {
                        final inputFormat = DateFormat('dd/MM/yyyy');
                        final outputFormat = DateFormat('yyyy-MM-dd');

                        if (state.pauseStartDate.isEmpty ||
                            state.pauseEndDate.isEmpty) {
                          return const SizedBox();
                        }

                        final sendStartDate = outputFormat
                            .format(inputFormat.parse(state.pauseStartDate));
                        final sendEndDate = outputFormat
                            .format(inputFormat.parse(state.pauseEndDate));

                        return CustomButton(
                          onPressed: () {
                            context
                                .read<PauseResumeSubCubit>()
                                .pauseSubscription(
                                  subscriptionId: widget.state.id ?? 0,
                                  pauseStartDate: sendStartDate,
                                  pauseEndDate: sendEndDate,
                                );
                            context
                                .read<PauseResumeSubCubit>()
                                .clearPauseDates();
                            Get.back();
                          },
                          text: AppString.pause,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )
        : SubscriptionCustomButton(
            icon: AppIcons.resume,
            title: AppString.resume,
            onTap: () {
              final customerId =
                  StorageManager.readData(StorageKeys.customerId);
              context.read<PauseResumeSubCubit>().resumeSubscription(
                  subscriptionId: widget.state.id ?? 0,
                  customerId: customerId ?? 0);
            },
          );
  }
}
