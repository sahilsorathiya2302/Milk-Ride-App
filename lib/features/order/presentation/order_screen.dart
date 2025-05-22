import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/custom_date_listview_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/delivered_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/order_status_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/refund_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/shimmer_list_placeholder_widget.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/to_be_delivered_info_widget.dart';

import '../../../core/constants/app_string.dart';
import '../../../core/routes/app_routes_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/ui_component/custom_date_show.dart';
import '../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../core/ui_component/network_fail_card.dart';

class OrderScreen extends StatefulWidget {
  final void Function()? onBack;
  const OrderScreen({super.key, this.onBack});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();

    final orderCubit = context.read<OrderCubit>();

    final selectedDate = orderCubit.state.selectedDate;
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    final customerId = StorageManager.readData(StorageKeys.customerId);

    orderCubit.order(
      deliveryDate: formattedDate,
      customerId: customerId,
    );
  }

  void _openDatePicker(BuildContext context) async {
    final orderCubit = context.read<OrderCubit>();
    final homeCubit = context.read<HomeCubit>();

    final baseDate = orderCubit.state.selectedDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: baseDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      orderCubit.selectDate(picked);
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      final customerId = homeCubit.customerData?.id ?? 1;

      orderCubit.order(
        deliveryDate: formattedDate,
        customerId: customerId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        DateTime selectedDate = DateTime.now();
        if (state is OrderLoadingState) {
          SizedBox();
        }
        if (state is OrderLoadedState) {
          selectedDate = state.selectedDate;
        }

        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (!didPop) {
              Get.offAllNamed(AppRoutesNames.mainScreen);
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.homeBG,
            appBar: CustomSimpleAppBar(
              leadingOnPressed: widget.onBack,
              title: AppString.myOrder,
              widget: state is OrderLoadingState
                  ? SizedBox()
                  : CustomDateShow(
                      text: selectedDate,
                      onTap: () => _openDatePicker(context),
                    ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                final customerId =
                    StorageManager.readData(StorageKeys.customerId);
                final selectedDate =
                    context.read<OrderCubit>().state.selectedDate;
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                context.read<OrderCubit>().order(
                      deliveryDate: formattedDate,
                      customerId: customerId,
                    );
              },
              child: _buildBody(state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(OrderState state) {
    if (state is OrderLoadingState) {
      return ShimmerListPlaceholderWidget();
    } else if (state is OrderErrorState) {
      return NetworkFailCard(message: state.errorMessage);
    } else if (state is OrderLoadedState) {
      return ListView(
        children: [
          Column(
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
                const SizedBox(),
            ],
          ),
        ],
      );
    } else {
      return Center(child: ShimmerListPlaceholderWidget());
    }
  }
}
