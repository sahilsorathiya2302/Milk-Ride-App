import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/pause_resume_cubit/pause_resume_sub_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/pause_resume_cubit/pause_resume_sub_state.dart';

import '../../../../../core/ui_component/custom_date_pick_text_field.dart';

class DateWidget extends StatelessWidget {
  final String startDate;
  final String endDate;

  DateWidget({super.key, required this.startDate, required this.endDate});

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> _selectDate({
    required BuildContext context,
    required bool isStartDate,
    required String currentStart,
    required String currentEnd,
  }) async {
    final DateTime subscriptionStart = DateTime.parse(startDate);
    final DateTime subscriptionEnd = DateTime.parse(endDate);
    final DateTime today = DateTime.now();

    final DateTime initialDate =
        subscriptionStart.isBefore(today) ? today : subscriptionStart;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate,
      lastDate: subscriptionEnd,
    );

    if (picked != null) {
      final updatedStart =
          isStartDate ? _dateFormat.format(picked) : currentStart;
      final updatedEnd = !isStartDate ? _dateFormat.format(picked) : currentEnd;

      Get.context?.read<PauseResumeSubCubit>().updatePauseDates(
            startDate: updatedStart,
            endDate: updatedEnd,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime subscriptionStart = DateTime.parse(startDate);
    final DateTime today = DateTime.now();
    final String showStartDate = DateFormat('dd/MM/yyyy')
        .format(subscriptionStart.isBefore(today) ? today : subscriptionStart);

    return BlocBuilder<PauseResumeSubCubit, PauseResumeSubState>(
      builder: (context, state) {
        final String currentStartDate =
            state.pauseStartDate.isEmpty ? showStartDate : state.pauseStartDate;

        return Column(
          children: [
            SizedBox(
              height: 50.h,
              child: CustomDatePickTextField(
                hintText: showStartDate,
                controller: TextEditingController(text: currentStartDate),
                onTap: () => _selectDate(
                  context: context,
                  isStartDate: true,
                  currentStart: currentStartDate,
                  currentEnd: state.pauseEndDate,
                ),
              ),
            ),
            10.height,
            SizedBox(
              height: 50.h,
              child: CustomDatePickTextField(
                controller: TextEditingController(
                  text: state.pauseEndDate.isNotEmpty ? state.pauseEndDate : '',
                ),
                hintText: AppString.toDate,
                onTap: () => _selectDate(
                  context: context,
                  isStartDate: false,
                  currentStart: currentStartDate,
                  currentEnd: state.pauseEndDate,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
