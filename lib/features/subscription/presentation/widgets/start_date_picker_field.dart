import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_state.dart';

class StartDatePickerField extends StatelessWidget {
  const StartDatePickerField({super.key});

  Future<void> _pickStartDate(BuildContext context) async {
    final cubit = context.read<SubscriptionCubit>();
    final today = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: today,
      lastDate: DateTime(today.year + 1),
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.green,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      final apiFormatted = DateFormat('yyyy-MM-dd').format(picked);
      cubit.setStartDate(apiFormatted);
      cubit.setEndDate('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        final controller = TextEditingController(
          text: state.startDate.isNotEmpty
              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(state.startDate))
              : '',
        );

        return GestureDetector(
          onTap: () => _pickStartDate(context),
          child: AbsorbPointer(
            child: CustomTextField(
              controller: controller,
              hintText: AppString.selectStartDate,
            ),
          ),
        );
      },
    );
  }
}
