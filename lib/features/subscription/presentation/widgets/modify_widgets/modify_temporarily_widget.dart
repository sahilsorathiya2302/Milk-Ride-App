import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_state.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/choose_date_widget.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/modify_widgets/modify_prod_info.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/modify_widgets/temp_change_summary_widget.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/pick_type_widget.dart';

import '../../../domain/entities/subscription_data.dart';

class ModifyTemporarilyWidget extends StatefulWidget {
  final SubscriptionData subscriptionData;
  const ModifyTemporarilyWidget({super.key, required this.subscriptionData});

  @override
  State<ModifyTemporarilyWidget> createState() =>
      _ModifyTemporarilyWidgetState();
}

class _ModifyTemporarilyWidgetState extends State<ModifyTemporarilyWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Get.context?.read<ModifyTemporarilyCubit>().reset();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ModifyTemporarilyCubit>();
    return Scaffold(
        backgroundColor: AppColors.homeBG,
        appBar: CustomSimpleAppBar(
          title: AppString.modifyTemporarily,
        ),
        body: BlocBuilder<ModifyTemporarilyCubit, ModifyTemporarilyState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ModifyProdInfo(
                  argument: widget.subscriptionData,
                  addOnPressed: () => cubit.incrementQuantity(),
                  removeOnPressed: () => cubit.decrementQuantity(),
                  qty: cubit.state.quantity,
                ),
                10.height,
                PickTypeWidget(),
                5.height,
                ChooseDateWidget(
                  startDate: widget.subscriptionData.startDate ?? "",
                  endDate: widget.subscriptionData.endDate ?? "",
                ),
                10.height,
                TempChangeSummaryWidget(
                  startDate: widget.subscriptionData.startDate ?? "",
                ),
                Spacer(),
                CustomButton(
                  textSize: AppTextSize.s13,
                  onPressed: () {
                    final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
                    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');

                    String formattedStart =
                        outputFormat.format(inputFormat.parse(
                      state.startDate.isNotEmpty
                          ? state.startDate
                          : DateFormat('dd/MM/yyyy').format(DateTime.parse(
                              widget.subscriptionData.startDate ?? "")),
                    ));

                    String formattedEnd = '';
                    if (state.pickType != AppString.singleDay &&
                        state.endDate.isNotEmpty) {
                      formattedEnd = outputFormat.format(
                        inputFormat.parse(state.endDate),
                      );
                    }
                    context
                        .read<ModifyTemporarilyCubit>()
                        .tempChangeSubscription(
                          subscriptionId: widget.subscriptionData.id ?? 0,
                          tempStartDate: formattedStart,
                          tempEndDate: formattedEnd,
                          tempQty: state.quantity,
                        );
                    Get.toNamed(AppRoutesNames.mainScreen,
                        arguments: {ArgumentKey.selectedIndex: 3});
                  },
                  text: AppString.updateSubscription,
                )
              ],
            ).paddingSymmetric(horizontal: 15.w, vertical: 10.h);
          },
        ));
  }
}
