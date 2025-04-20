import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/drag_handle.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/logout_button.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/profile_header.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/referral_code_box.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/user_balance_details_section.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/user_info_card.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/user_personal_details_section.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/vacation_mode_switch.dart';

void showProfileBottomSheet() {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.84,
        maxChildSize: 0.84,
        expand: false,
        builder: (_, controller) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                final customer = state.homeResponse.data?.customer;

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.homeBG,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DragHandle(),
                      const ProfileHeader(),
                      Expanded(
                        child: ListView(
                          controller: controller,
                          padding: const EdgeInsets.only(top: 10),
                          children: [
                            UserInfoCard(customer: customer),
                            10.height,
                            const VacationModeSwitch(),
                            10.height,
                            ReferralCodeBox(customer: customer),
                            10.height,
                            UserPersonalDetailsSection(customer: customer),
                            20.height,
                            UserBalanceDetailsSection(customer: customer),
                            10.height,
                            const LogoutButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is HomeError) {
                return NetworkFailCard(message: state.failure);
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      );
    },
  );
}
