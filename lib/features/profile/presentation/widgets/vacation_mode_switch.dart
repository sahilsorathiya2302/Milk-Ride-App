import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_cubit.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_state.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';

class VacationModeSwitch extends StatelessWidget {
  final int isVacation;
  const VacationModeSwitch({super.key, required this.isVacation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: ListTile(
        leading: const Icon(Icons.child_friendly_outlined),
        title: CustomText(
          text: AppString.vacationMode,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ),
        trailing: BlocBuilder<VacationCubit, VacationState>(
          builder: (context, state) {
            final status = isVacation == 1;

            bool? isSwitched = status;

            if (state is VacationInitial) {
              isSwitched = state.isSwitched;
            } else if (state is VacationSuccess) {
              isSwitched = state.isSwitched as bool?;
            }

            return Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                activeTrackColor: AppColors.primaryColor,
                value: isSwitched ?? false,
                onChanged: (value) {
                  showConfirmationDialog(
                    title: AppString.areYouSure,
                    subTitle: value == true
                        ? AppString.vacationModeOn
                        : AppString.vacationModeOff,
                    onPressed: () {
                      context.read<VacationCubit>().vacationToggle(value);
                      Get.back();
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
