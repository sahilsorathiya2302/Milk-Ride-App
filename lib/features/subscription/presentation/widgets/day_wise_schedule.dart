import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_quantity_sector.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';

import '../cubit/subscription_state.dart';

class DayWiseSchedule extends StatelessWidget {
  const DayWiseSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        final cubit = context.read<SubscriptionCubit>();

        final quantities = cubit.state.dayQuantities;

        return Container(
          color: AppColors.white,
          child: ListView.builder(
            itemCount: weekDays.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.homeBG,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: weekDays[index],
                          fontWeight: FontWeight.w600,
                          fontSize: AppTextSize.s13,
                        ),
                        CustomQuantitySector(
                          quantity: quantities[index].toString(),
                          addOnPressed: () {
                            cubit.updateDayQuantity(
                                index, quantities[index] + 1);
                          },
                          removeOnPressed: () {
                            if (quantities[index] > 0) {
                              cubit.updateDayQuantity(
                                  index, quantities[index] - 1);
                            }
                          },
                        ),
                      ],
                    ),
                  ).paddingSymmetric(
                    horizontal: 10.h,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
