import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_state.dart';

class EndDatePickerField extends StatelessWidget {
  const EndDatePickerField({super.key});

  Future<void> _pickEndDate(BuildContext context) async {
    final cubit = context.read<SubscriptionCubit>();
    final today = DateTime.now();

    DateTime? minDate;
    try {
      minDate = DateFormat('yyyy-MM-dd').parse(cubit.state.startDate);
    } catch (_) {
      minDate = today;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: minDate,
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
      cubit.setEndDate(apiFormatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        final controller = TextEditingController(
          text: state.endDate.isNotEmpty
              ? DateFormat('dd-MM-yyyy').format(DateTime.parse(state.endDate))
              : '',
        );

        return GestureDetector(
          onTap: () => _pickEndDate(context),
          child: AbsorbPointer(
            child: CustomTextField(
              controller: controller,
              hintText: AppString.selectEndDate,
            ),
          ),
        );
      },
    );
  }
}
