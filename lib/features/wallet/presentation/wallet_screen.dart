import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_simple_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_state.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/history_widgets/history_main_widget.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/wallet/wallet_main_widget.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/widgets/wallet/wallet_shimmer_place_holder.dart';

import '../../../core/constants/app_string.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    context.read<WalletCubit>().wallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomSimpleAppBar(
        color: AppColors.white,
        title: AppString.myWallet,
      ),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          if (state is WalletLoading) {
            return WalletShimmerPlaceHolder();
          } else if (state is WalletError) {
            return NetworkFailCard(message: state.errorMessage);
          } else if (state is WalletLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  WalletMainWidget(
                    walletData: state.walletResponse.data,
                  ),
                  state.walletResponse.data?.walletHistory?.isNotEmpty ?? false
                      ? HistoryMainWidget(
                          walletHistoryState:
                              state.walletResponse.data?.walletHistory ?? [],
                        )
                      : SizedBox(),
                ],
              ),
            );
          }
          return WalletShimmerPlaceHolder();
        },
      ),
    );
  }
}
