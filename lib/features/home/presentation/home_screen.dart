import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_app_loader.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/banner_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/best_seller_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/categories_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/home_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/new_arrival_info_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/side_menu_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/ui_component/custom_dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showBottomSheet = false;

  void sendData() async {
    final userId = StorageManager.readData(StorageKeys.userId);
    final mobileNumber = StorageManager.readData(StorageKeys.mobileNumber);

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    Get.context!.read<HomeCubit>().getHomeData(
          HomeParam(
            mobileNumber: mobileNumber,
            userId: userId,
            type: AppString.app,
            deviceType: AppString.android,
            devicesModel: androidInfo.model,
            version: packageInfo.version,
            devicesId: androidInfo.id,
          ),
        );
  }

  @override
  void initState() {
    sendData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDeleteConfirmationDialog(
          title: AppString.appCloseConfirm,
          subTitle: AppString.appCloseConfirmMessage,
          onPressed: () {
            SystemNavigator.pop();
          },
        );

        return shouldExit ?? false;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.homeBG,
        appBar: CustomAppBar(
          centerTitle: true,
          leadingOnPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          imageName: AppImagesKey.logo,
          leadingIcon: AppIcons.menuIcons,
          actionIcon: AppIcons.walletIcons,
        ),
        drawer: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            int customerId = 0;
            if (state is HomeLoaded) {
              customerId = state.homeResponse.data?.customer?.id ?? 0;
            }
            return SideMenuWidget(
              customerId: customerId,
              onProfileTap: () {
                setState(() {
                  showBottomSheet = true;
                });
              },
            );
          },
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CustomAppLoader();
            } else if (state is HomeError) {
              return NetworkFailCard(
                message: state.failure.toString(),
              );
            } else if (state is HomeLoaded) {
              final customerId = state.homeResponse.data?.customer?.id ?? 0;

              return ListView(
                children: [
                  10.height,
                  BannerWidget(bannerState: state.headerBanners ?? []),
                  10.height,
                  CategoriesWidget(
                    configImage: state.homeResponse.data?.config?.logoUrl ?? "",
                    state: state.categories ?? [],
                    customerId: customerId,
                  ),
                  10.height,
                  NewArrivalInfoWidget(
                    state: state.homeResponse.data!.newArrival,
                    customerId: state.homeResponse.data?.customer?.id ?? 0,
                  ),
                  10.height,
                  BannerWidget(bannerState: state.middleBanners ?? []),
                  10.height,
                  BestSellerWidget(
                    state: state.bestSeller ?? [],
                    customerId: state.homeResponse.data?.customer?.id ?? 0,
                  ),
                  10.height,
                  // SeasonalWidget(
                  //   state: state.seasonal ?? [],
                  //   customerId: state.homeResponse.data?.customer?.id ?? 0,
                  // ),
                  // 10.height,
                  BannerWidget(bannerState: state.footerBanners ?? []),
                  10.height,
                ],
              );
            } else {
              return const Center(child: HomeShimmerPlaceHolder());
            }
          },
        ),
      ),
    );
  }
}
