import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/cubit/profile_state.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/delete_button.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/drag_handle.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/logout_button.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/profile_header.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/profile_place_holder_shimmer.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/referral_code_box.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/user_balance_details_section.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/user_info_card.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/user_personal_details_section.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/vacation_mode_switch.dart';

void showProfileBottomSheet() {
  final context = Get.context;
  context!.read<ProfileCubit>().profile();

  showModalBottomSheet(
    context: context,
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
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                final customer = state.profileResponse.data;

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
                            VacationModeSwitch(
                              isVacation: context
                                      .read<HomeCubit>()
                                      .homeData
                                      ?.isVacation ??
                                  0,
                            ),
                            10.height,
                            ReferralCodeBox(customer: customer),
                            10.height,
                            UserPersonalDetailsSection(customer: customer),
                            20.height,
                            UserBalanceDetailsSection(customer: customer!),
                            10.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const DeleteButton(),
                                const LogoutButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileError) {
                return NetworkFailCard(message: state.errorMessage);
              }
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.homeBG,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(16),
                child: const ProfilePlaceHolderShimmer(),
              );
            },
          );
        },
      );
    },
  );
}
