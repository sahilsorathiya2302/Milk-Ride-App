import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({super.key});

  static const List<String> _statusList = [
    AppString.orderStatusTobeDelivered,
    AppString.orderStatusDelivered,
    AppString.orderStatusRefund,
  ];

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    final selectedIndex = cubit.state.index;
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: OrderStatusWidget._statusList.length,
        separatorBuilder: (context, index) => 15.width,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              context.read<OrderCubit>().selectedStatus(index);
            },
            child: Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : AppColors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor : AppColors.grey,
                ),
              ),
              child: Center(
                child: CustomText(
                  text: OrderStatusWidget._statusList[index],
                  fontSize: AppTextSize.s11,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          );
        },
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}
