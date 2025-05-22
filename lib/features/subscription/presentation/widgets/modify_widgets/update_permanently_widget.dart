import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/update_permanently/update_permanently_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/update_permanently/update_permanently_state.dart';

import '../../../../../core/theme/app_border_radius.dart';
import 'modify_prod_info.dart';

class UpdatePermanentlyWidget extends StatefulWidget {
  final SubscriptionData subscriptionArgument;
  const UpdatePermanentlyWidget(
      {super.key, required this.subscriptionArgument});

  @override
  State<UpdatePermanentlyWidget> createState() =>
      _UpdatePermanentlyWidgetState();
}

class _UpdatePermanentlyWidgetState extends State<UpdatePermanentlyWidget> {
  @override
  void initState() {
    context.read<UpdatePermanentlyCubit>().updatePermanentlyInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdatePermanentlyCubit>();
    return Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(
          title: AppString.updatePermanently,
        ),
        body: BlocBuilder<UpdatePermanentlyCubit, UpdatePermanentlyState>(
          builder: (context, state) {
            return Column(
              children: [
                ModifyProdInfo(
                  argument: widget.subscriptionArgument,
                  removeOnPressed: cubit.decrementQuantity,
                  addOnPressed: cubit.incrementQuantity,
                  qty: cubit.state.quantity,
                ),
                10.height,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        maxLine: 2,
                        text: AppString.subUpdatePermanentlyMessage,
                      ).paddingSymmetric(horizontal: 10, vertical: 5),
                    ],
                  ),
                ),
                Spacer(),
                CustomButton(
                    textSize: AppTextSize.s13,
                    onPressed: () {
                      context.read<UpdatePermanentlyCubit>().updatePermanent(
                          subscriptionId: widget.subscriptionArgument.id ?? 0,
                          frequencyType:
                              widget.subscriptionArgument.frequencyType ?? "",
                          qty: state.quantity);
                    },
                    text: AppString.updateSubscription),
              ],
            ).paddingSymmetric(horizontal: 15.w, vertical: 10.h);
          },
        ));
  }
}
