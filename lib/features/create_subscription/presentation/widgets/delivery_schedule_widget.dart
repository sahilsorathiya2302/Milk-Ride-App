import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_list.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_state.dart';

class DeliveryScheduleWidget extends StatelessWidget {
  const DeliveryScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSubscriptionCubit, CreateSubscriptionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.deliverySchedule,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s14,
            ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              color: AppColors.white,
              child: Wrap(
                spacing: 10.w, // horizontal space
                children:
                    List.generate(AppList.scheduleOptions.length, (index) {
                  final schedule = AppList.scheduleOptions[index];
                  final isSelected = schedule == state.deliverySchedule;

                  return OutlinedButton(
                    onPressed: () {
                      context
                          .read<CreateSubscriptionCubit>()
                          .changeDeliverySchedule(schedule);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      fixedSize: Size(100.w, 25.h),
                      side: BorderSide(
                        color: isSelected ? AppColors.black : AppColors.grey,
                      ),
                      backgroundColor: isSelected
                          ? AppColors.primaryLightColor
                          : AppColors.white,
                    ),
                    child: CustomText(
                      text: schedule,
                      color: isSelected ? AppColors.black : AppColors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: AppTextSize.s10,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
