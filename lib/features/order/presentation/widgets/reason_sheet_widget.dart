import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_divider.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/reason_placeholder_widget.dart';

class ReasonSheetWidget extends StatelessWidget {
  const ReasonSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppBar(
        title: AppString.cancelOrderReason,
        color: AppColors.primaryLightColor,
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return ReasonPlaceholderWidget();
          } else if (state is OrderErrorState) {
            return NetworkFailCard(message: state.errorMessage);
          } else if (state is OrderLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return CustomDivider();
              },
              itemBuilder: (context, index) {
                final reason = state.orderResponse.data?.orderReasons?[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35.h,
                      child: InkWell(
                        child: Row(
                          children: [
                            CustomText(
                              text: reason?.name ?? AppString.empty,
                              fontSize: AppTextSize.s13,
                              fontWeight: FontWeight.w700,
                            ).paddingSymmetric(horizontal: 10),
                          ],
                        ),
                        onTap: () {
                          final selectedReason =
                              reason?.name ?? AppString.empty;
                          final int reasonId = reason?.id ?? 0;
                          context.read<OrderCubit>().selectReason(
                              selectedReason, reasonId); // pass to Cubit
                          Get.back(result: selectedReason);
                          // pass back to previous screen
                        },
                      ),
                    ),
                  ],
                );
              },
              itemCount: state.orderResponse.data!.orderReasons!.length,
            );
          }
          return ReasonPlaceholderWidget();
        },
      ),
    );
  }
}
