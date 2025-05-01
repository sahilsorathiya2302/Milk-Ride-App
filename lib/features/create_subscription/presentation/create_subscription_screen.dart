import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_state.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/widgets/select_date_widget.dart';

import 'widgets/day_wise_schedule.dart';
import 'widgets/delivery_schedule_widget.dart';
import 'widgets/product_info_with_quantity_widget.dart';
import 'widgets/subscription_button_widget.dart';
import 'widgets/subscription_delivery_type_widget.dart';

class CreateSubscriptionScreen extends StatefulWidget {
  final dynamic subscriptionItemArgument;
  const CreateSubscriptionScreen({super.key, this.subscriptionItemArgument});

  @override
  State<CreateSubscriptionScreen> createState() =>
      _CreateSubscriptionScreenState();
}

class _CreateSubscriptionScreenState extends State<CreateSubscriptionScreen> {
  @override
  void initState() {
    context.read<CreateSubscriptionCubit>().resetState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      appBar: CustomSimpleAppBar(
        title: AppString.subscription,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfoWithQuantityWidget(
                  getArgument: widget.subscriptionItemArgument,
                ),
                SubscriptionDeliveryTypeWidget(),
                DeliveryScheduleWidget(),
                SelectDateWidget(),
                20.height,
                BlocBuilder<CreateSubscriptionCubit, CreateSubscriptionState>(
                  builder: (context, state) {
                    return state.deliverySchedule == AppString.dayWise
                        ? Column(
                            children: [
                              DayWiseSchedule(),
                              100.height,
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SubscriptionButtonWidget(
              subscriptionArgument: widget.subscriptionItemArgument,
            ),
          ).paddingSymmetric(
            vertical: 20.h,
          ),
        ],
      ),
    );
  }
}
