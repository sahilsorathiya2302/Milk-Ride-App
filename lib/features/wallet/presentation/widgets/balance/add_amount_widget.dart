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
    useSafeArea: true,
    backgroundColor: AppColors.homeBG,
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppBorderRadius.r15),
      ),
    ),
    context: context,
    builder: (context) {
      context.read<AddBalanceCubit>().resetState();

      return DraggableScrollableSheet(
        initialChildSize: 0.60,
        maxChildSize: 0.70,
        expand: false,
        minChildSize: 0.60,
        builder: (context, scrollController) {
          final cubit = context.read<AddBalanceCubit>();

          return BlocBuilder<AddBalanceCubit, AddBalanceState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
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
                        controller: scrollController,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomWalletButton(
                                  onPressed: () {
                                    cubit.selectMethod(AppString.online);
                                  },
                                  icon: AppIcons.wallet2,
                                  title: AppString.payOnline,
                                  isSelected:
                                      state.selectedMethod == AppString.online,
                                ),
                                CustomWalletButton(
                                  onPressed: () {
                                    cubit.selectMethod(AppString.cash);
                                  },
                                  icon: AppIcons.wallet2,
                                  title: AppString.requestCash,
                                  isSelected:
                                      state.selectedMethod == AppString.cash,
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
                            10.height,
                            EnterAmountWidget(),
                            10.height,
                            if (state.selectedMethod == AppString.cash)
                              CashPayDateWidget(),
                            30.height, // Extra space above the button
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: state.selectedMethod == AppString.cash
                          ? CashRequestButton()
                          : AddAmountButton(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
