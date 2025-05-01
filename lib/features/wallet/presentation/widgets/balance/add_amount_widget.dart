import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_state.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/balance/cash_pay_date_widget.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/ui_component/custom_simple_app_bar.dart';
import '../../../../../core/ui_component/custom_wallet_button.dart';
import '../../cubit/add_balance/add_balance_cubit.dart';
import 'add_amount_button.dart';
import 'cash_request_button.dart';
import 'enter_amount_widget.dart';

void addAmount({required BuildContext context}) {
  context.read<AddBalanceCubit>().resetState();

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.homeBG,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppBorderRadius.r15),
      ),
    ),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.60,
        maxChildSize: 0.60,
        expand: false,
        builder: (context, scrollController) {
          final cubit = context.read<AddBalanceCubit>();
          return BlocBuilder<AddBalanceCubit, AddBalanceState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppBorderRadius.r15),
                          topRight: Radius.circular(AppBorderRadius.r15),
                        ),
                        child: CustomSimpleAppBar(
                          title: AppString.addAmount,
                        ),
                      ),
                      10.height,
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          controller: scrollController,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomWalletButton(
                                        onPressed: () {
                                          context
                                              .read<AddBalanceCubit>()
                                              .selectMethod(AppString.online);
                                        },
                                        icon: AppIcons.wallet2,
                                        title: AppString.payOnline,
                                        isSelected: state.selectedMethod ==
                                            AppString.online, // NEW
                                      ),
                                      CustomWalletButton(
                                        onPressed: () {
                                          context
                                              .read<AddBalanceCubit>()
                                              .selectMethod(AppString.cash);
                                        },
                                        icon: AppIcons.wallet2,
                                        title: AppString.requestCash,
                                        isSelected: state.selectedMethod ==
                                            AppString.cash, // NEW
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  10.height,
                                  EnterAmountWidget(),
                                  10.height,
                                  cubit.state.selectedMethod == AppString.cash
                                      ? CashPayDateWidget()
                                      : SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  cubit.state.selectedMethod == AppString.cash
                      ? CashRequestButton()
                      : AddAmountButton(),
                ],
              );
            },
          );
        },
      );
    },
  );
}
