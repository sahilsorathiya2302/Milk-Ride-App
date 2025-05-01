import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/ui_component/custom_text_field.dart';
import '../../cubit/add_balance/add_balance_state.dart';

class CashPayDateWidget extends StatefulWidget {
  const CashPayDateWidget({super.key});

  @override
  State<CashPayDateWidget> createState() => _CashPayDateWidgetState();
}

class _CashPayDateWidgetState extends State<CashPayDateWidget> {
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final today = "${now.day}/${now.month}/${now.year}";

    final cubit = context.read<AddBalanceCubit>();

    final selectedDate =
        cubit.state.selectDate.isNotEmpty ? cubit.state.selectDate : today;

    dateController.text = selectedDate;

    if (cubit.state.selectDate.isEmpty) {
      cubit.selectDate(today);
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formatted = "${picked.day}/${picked.month}/${picked.year}";
      context.read<AddBalanceCubit>().selectDate(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBalanceCubit, AddBalanceState>(
      builder: (context, state) {
        dateController.text = state.selectDate;

        return state.selectedMethod == AppString.cash
            ? SizedBox(
                height: 45.h,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: CustomTextField(
                      filled: true,
                      borderColor: AppColors.transparent,
                      fillColor: AppColors.white,
                      borderRadius: AppBorderRadius.r10,
                      sufFixIcon: Icon(AppIcons.calendar),
                      controller: dateController,
                      hintText: AppString.date,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 10.w),
              )
            : const SizedBox();
      },
    );
  }
}
