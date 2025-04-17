import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/delivered_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/order_status_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/refund_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/shimmer_list_placeholder_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/to_be_delivered_info_widget.dart';

import 'widgets/custom_date_listview_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  void _openDatePicker(BuildContext context) async {
    final baseDate = context.read<OrderCubit>().state.baseDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: baseDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      Get.context?.read<OrderCubit>().changeBaseDate(picked);
    }
  }

  @override
  void initState() {
    super.initState();
    final customerId = context.read<HomeCubit>().customerData?.id;
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Trigger order loading with the initial data
    context.read<OrderCubit>().order(
          deliveryDate: formattedDate,
          customerId: customerId ?? 1,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
        title: AppString.myOrder,
        icon: AppIcons.calendar,
        onPressed: () => _openDatePicker(context),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoadingState) {
              return ShimmerListPlaceholderWidget();
            } else if (state is OrderErrorState) {
              return NetworkFailCard(
                message: state.errorMessage,
              );
            } else if (state is OrderLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  CustomDateListView(),
                  10.height,
                  OrderStatusWidget(),
                  10.height,
                  if (state.index == 0)
                    ToBeDeliveredInfoWidget()
                  else if (state.index == 1)
                    DeliveredWidget()
                  else if (state.index == 2)
                    RefundWidget()
                  else
                    SizedBox(),
                ],
              );
            }
            return Center(child: ShimmerListPlaceholderWidget());
          },
        ),
      ),
    );
  }
}
