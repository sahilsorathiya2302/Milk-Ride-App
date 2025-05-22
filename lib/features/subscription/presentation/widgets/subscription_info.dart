import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_empty_screen.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_state.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/delete_button.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/modify_widgets/modify_button_widget.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/pause_resume_wigets/pause_info_widget.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/pause_resume_wigets/pause_resume_button.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_prod_info_widget.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_tile_widget.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/key/app_images_key.dart';
import '../../../../core/routes/app_routes_names.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui_component/custom_divider.dart';

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        if (state is SubscriptionLoading) {
          return SubscriptionShimmerPlaceHolder();
        } else if (state is SubscriptionError) {
          return Expanded(
            child: NetworkFailCard(message: state.errorMessage),
          );
        } else if (state is SubscriptionLoaded) {
          final subscriptions = state.subscriptionResponse.data;
          if (subscriptions != null && subscriptions.isNotEmpty) {
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  final customerId =
                      StorageManager.readData(StorageKeys.customerId);
                  final userId = StorageManager.readData(StorageKeys.userId);
                  context.read<SubscriptionCubit>().mySubscription(
                      customerId: customerId ?? 0, userId: userId);
                },
                child: ListView.builder(
                  itemCount: state.subscriptionResponse.data?.length,
                  itemBuilder: (context, index) {
                    final subscriptionData =
                        state.subscriptionResponse.data![index];

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                            AppBorderRadius.r15,
                          )),
                      child: Column(
                        children: [
                          SubscriptionTileWidget(
                            tileState: subscriptionData,
                          ),
                          10.height,
                          SubscriptionProdInfoWidget(
                            productState: subscriptionData,
                          ),
                          5.height,
                          CustomDivider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DeleteButton(state: subscriptionData),
                              5.width,
                              ModifyButtonWidget(state: subscriptionData),
                              5.width,
                              PauseResumeButton(state: subscriptionData),
                              5.width,
                            ],
                          ),
                          10.height,
                          subscriptionData.pauseSubscription == null
                              ? SizedBox()
                              : PauseInfoWidget(
                                  pauseSubscription:
                                      subscriptionData.pauseSubscription!,
                                ),
                        ],
                      ),
                    ).paddingSymmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    );
                  },
                ),
              ),
            );
          }
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomEmptyScreen(
                  imgHeight: 50.h,
                  imgWidth: 50.w,
                  buttonText: AppString.subscribeNow,
                  onPressed: () {
                    Get.offAllNamed(AppRoutesNames.mainScreen);
                  },
                  text: AppString.subscriptionNotFound,
                  imagesPath: AppImagesKey.bucket,
                  subText: AppString.subscriptionNotFoundSubText,
                ).paddingSymmetric(horizontal: 10.w)
              ],
            ),
          );
        }
        return SubscriptionShimmerPlaceHolder();
      },
    );
  }
}
