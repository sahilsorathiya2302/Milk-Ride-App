import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final today = DateTime.now();
    String todayFormatted = DateFormat('dd-MM-yyyy').format(today);
    startDateController.text = todayFormatted;
  }

  Future<void> _pickDate({
    required TextEditingController controller,
    bool? isStartDate,
  }) async {
    final today = DateTime.now();
    DateTime? minDate;
    try {
      minDate = isStartDate == true
          ? today
          : DateFormat('dd-MM-yyyy').parse(startDateController.text);
    } catch (e) {
      print("⚠️ Invalid start date, fallback to today: $e");
      minDate = today;
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      // initialDate: minDate,
      firstDate: minDate,
      lastDate: DateTime(today.year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
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

    if (pickedDate != null) {
      print("===========>Hello");
      String uiFormatted = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.text = uiFormatted;

      String apiFormatted = DateFormat('yyyy-MM-dd').format(pickedDate);

      final cubit = context.read<SubscriptionCubit>();

      if (isStartDate == true) {
        print(startDateController.text);
        print(apiFormatted);
        cubit.setStartDate(apiFormatted); // Send to API
        endDateController.clear(); // Clear UI end date
        cubit.setEndDate(''); // Reset in Cubit too
      } else {
        cubit.setEndDate(apiFormatted); // Send to API
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.chooseDate,
          fontWeight: FontWeight.w600,
          fontSize: AppTextSize.s14,
        ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
        Container(
          height: 70,
          width: context.width,
          decoration: BoxDecoration(color: AppColors.white),
          child: Row(
            children: [
              10.width,
              Expanded(
                child: GestureDetector(
                  onTap: () => _pickDate(
                    controller: startDateController,
                    isStartDate: true,
                  ),
                  child: AbsorbPointer(
                    child: SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        controller: startDateController,
                        hintText: AppString.selectStartDate,
                      ),
                    ),
                  ),
                ),
              ),
              10.width,
              Expanded(
                child: GestureDetector(
                  onTap: () => _pickDate(
                    controller: endDateController,
                    isStartDate: false,
                  ),
                  child: AbsorbPointer(
                    child: SizedBox(
                      height: 50.h,
                      child: CustomTextField(
                        controller: endDateController,
                        hintText: AppString.selectEndDate,
                      ),
                    ),
                  ),
                ),
              ),
              10.width,
            ],
          ),
        ),
      ],
    );
  }
}
