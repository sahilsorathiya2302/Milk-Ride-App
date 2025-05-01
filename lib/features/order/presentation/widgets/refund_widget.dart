import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_details.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_info.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/not_order_found_widget.dart';

class RefundWidget extends StatefulWidget {
  const RefundWidget({super.key});

  @override
  State<RefundWidget> createState() => _RefundWidgetState();
}

class _RefundWidgetState extends State<RefundWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>().orderData;
    final orderDetailsCubit = context.read<OrderCubit>().orderDetails;

    return Column(
      children: [
        cubit?.refund?.isNotEmpty ?? false
            ? Column(
                children: [
                  CustomOrderInfo(cubit: cubit?.refund),
                  CustomOrderDetails(
                    subTotal:
                        orderDetailsCubit?.refundGrandTotal.toString() ?? "0",
                    amount:
                        orderDetailsCubit?.refundGrandTotal.toString() ?? "0",
                    amountTitle: AppString.refundAmount,
                  )
                ],
              )
            : NotOrderFoundWidget()
      ],
    ).paddingSymmetric(horizontal: 15.w);
  }
}
