import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_details.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_info.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/not_order_found_widget.dart';

class DeliveredWidget extends StatefulWidget {
  const DeliveredWidget({super.key});

  @override
  State<DeliveredWidget> createState() => _DeliveredWidgetState();
}

class _DeliveredWidgetState extends State<DeliveredWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>().orderData;
    final orderDetailsCubit = context.read<OrderCubit>().orderDetails;
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Column(
          children: [
            cubit?.delivered?.isNotEmpty ?? false
                ? Column(
                    children: [
                      CustomOrderInfo(cubit: cubit?.delivered),
                      CustomOrderDetails(
                          subTotal: orderDetailsCubit?.deliveredGrandTotal
                                  .toString() ??
                              "0",
                          amount: orderDetailsCubit?.deliveredGrandTotal
                                  .toString() ??
                              "0")
                    ],
                  )
                : NotOrderFoundWidget(),
          ],
        ).paddingSymmetric(horizontal: 15.w);
      },
    );
  }
}
