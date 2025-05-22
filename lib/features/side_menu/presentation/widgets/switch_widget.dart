import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../cubit/vacation/vacation_cubit.dart';
import '../cubit/vacation/vacation_state.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppString.vacationMode,
            fontSize: AppTextSize.s16,
            fontWeight: FontWeight.w700,
          ),
          BlocBuilder<VacationCubit, VacationState>(
            builder: (context, state) {
              final status =
                  context.read<HomeCubit>().homeData?.isVacation == 1;

              bool? isSwitched = status;

              return Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  activeTrackColor: AppColors.primaryColor,
                  value: isSwitched,
                  onChanged: (value) {
                    showConfirmationDialog(
                      title: AppString.areYouSure,
                      subTitle: value == true
                          ? AppString.vacationModeOn
                          : AppString.vacationModeOff,
                      onPressed: () {
                        context.read<VacationCubit>().vacationToggle(value);
                        Scaffold.of(context).closeDrawer();
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    ).paddingOnly(
      top: 10.h,
    );
  }
}
