import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';

import '../../../../../core/constants/app_string.dart';

class TempChangeSummaryWidget extends StatelessWidget {
  final String startDate;
  const TempChangeSummaryWidget({super.key, required this.startDate});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ModifyTemporarilyCubit>();

    final DateTime minDate = DateTime.parse(startDate);

    final String formattedStart = DateFormat('dd/MM/yyyy').format(minDate);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
      child: Column(
        children: [
          cubit.state.pickType == AppString.singleDay
              ? tempInfoText(
                  text:
                      "${AppString.subscriptionChange} ${cubit.state.quantity} ${AppString.stringFor} ${cubit.state.startDate.isEmpty ? formattedStart : cubit.state.startDate}")
              : tempInfoText(
                  text:
                      "${AppString.subscriptionChange} ${cubit.state.quantity} ${AppString.from} ${cubit.state.startDate.isEmpty ? formattedStart : cubit.state.startDate} ${AppString.to} ${cubit.state.endDate} ${AppString.date}")
        ],
      ),
    );
  }

  Widget tempInfoText({required String text}) {
    return CustomText(
      maxLine: 2,
      text: text,
    ).paddingSymmetric(horizontal: 10.w, vertical: 5.h);
  }
}
