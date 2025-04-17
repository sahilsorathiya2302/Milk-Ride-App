import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';

class CustomDateListView extends StatelessWidget {
  const CustomDateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final dates = state.surroundingDates;

        return SizedBox(
            height: 70.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final isSelected = date.year == state.selectedDate.year &&
                    date.month == state.selectedDate.month &&
                    date.day == state.selectedDate.day;

                return GestureDetector(
                  onTap: () {
                    final customerId =
                        context.read<HomeCubit>().customerData?.id;
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(date);

                    context.read<OrderCubit>().order(
                        deliveryDate: formattedDate,
                        customerId: customerId ?? 0);

                    context.read<OrderCubit>().selectDate(date);
                  },
                  child: Container(
                    width: 65.w,
                    decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                        boxShadow: [
                          isSelected
                              ? BoxShadow(
                                  color: AppColors.grey,
                                  blurRadius: 10,
                                  offset: Offset(1, 1))
                              : BoxShadow(
                                  color: AppColors.transparent,
                                  blurRadius: 10,
                                  offset: Offset(1, 1))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('d').format(date),
                          style: TextStyle(
                            fontFamily: AppString.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: AppTextSize.s18,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ).paddingSymmetric(horizontal: 10),
                        Text(DateFormat('E').format(date),
                            style: TextStyle(
                              fontFamily: AppString.fontFamily,
                              color: isSelected ? Colors.white : Colors.black,
                            )).paddingSymmetric(horizontal: 10),
                      ],
                    ),
                  ),
                ).paddingOnly(
                    left: index == 0 ? 15 : 10, right: index == 14 ? 15 : 0);
              },
            ));
      },
    );
  }
}
