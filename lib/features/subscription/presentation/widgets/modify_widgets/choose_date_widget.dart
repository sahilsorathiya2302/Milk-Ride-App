import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_date_pick_text_field.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_state.dart';

import '../../../../../core/theme/app_text_size.dart';

class ChooseDateWidget extends StatelessWidget {
  final String startDate;
  final String endDate;

  const ChooseDateWidget({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  Future<void> _pickDate({
    required BuildContext context,
    required Function(String) onPicked,
    required DateTime minDate,
    required DateTime maxDate,
    DateTime? initial,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null) {
      final formatted = DateFormat('dd/MM/yyyy').format(picked);
      onPicked(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime parsedStart = DateTime.parse(startDate);
    final DateTime parsedEnd = DateTime.parse(endDate);
    final DateTime today = DateTime.now();

    final DateTime minDate = parsedStart.isBefore(today)
        ? DateTime(today.year, today.month, today.day)
        : parsedStart;

    return BlocBuilder<ModifyTemporarilyCubit, ModifyTemporarilyState>(
      builder: (context, state) {
        final cubit = context.read<ModifyTemporarilyCubit>();

        final String startText = state.startDate.isEmpty
            ? DateFormat('dd/MM/yyyy').format(minDate)
            : state.startDate;

        final String endText = state.endDate;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.chooseDate,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s14,
            ),
            5.height,
            Row(
              children: [
                Expanded(
                  child: CustomDatePickTextField(
                    hintText: startText,
                    controller: TextEditingController(text: startText),
                    onTap: () => _pickDate(
                      context: context,
                      onPicked: cubit.updateStartDate,
                      minDate: minDate,
                      maxDate: parsedEnd,
                    ),
                  ),
                ),
                if (state.pickType != AppString.singleDay) ...[
                  5.width,
                  Expanded(
                    child: CustomDatePickTextField(
                      hintText: endText.isEmpty ? AppString.toDate : endText,
                      controller: TextEditingController(text: endText),
                      onTap: () => _pickDate(
                        context: context,
                        onPicked: cubit.updateEndDate,
                        minDate: minDate,
                        maxDate: parsedEnd,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        );
      },
    );
  }
}
