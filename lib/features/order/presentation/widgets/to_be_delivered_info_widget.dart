import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_info.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/not_order_found_widget.dart';

import '../../../../core/ui_component/custom_order_details.dart';

class ToBeDeliveredInfoWidget extends StatefulWidget {
  const ToBeDeliveredInfoWidget({super.key});

  @override
  State<ToBeDeliveredInfoWidget> createState() =>
      _ToBeDeliveredInfoWidgetState();
}

class _ToBeDeliveredInfoWidgetState extends State<ToBeDeliveredInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>().orderData;
    final orderDetailsCubit = context.read<OrderCubit>().orderDetails;
    return Column(
      children: [
        cubit?.toBeDelivered?.isNotEmpty ?? false
            ? Column(
                children: [
                  CustomOrderInfo(
                    cubit:
                        context.read<OrderCubit>().orderData?.toBeDelivered ??
                            [],
                  ),
                  CustomOrderDetails(
                    subTotal:
                        orderDetailsCubit?.toBeDeliveredGrandTotal.toString() ??
                            "0",
                    amount:
                        orderDetailsCubit?.toBeDeliveredGrandTotal.toString() ??
                            "0",
                  )
                ],
              )
            : NotOrderFoundWidget()
      ],
    ).paddingSymmetric(horizontal: 15.w);
  }
}
