import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
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
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/banner_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/best_seller_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/categories_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/new_arrival_info_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/seasonal_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/widget/side_menu_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showBottomSheet = false;

  @override
  void initState() {
    super.initState();
    sendData();
  }

  void sendData() {
    Future.microtask(() async {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final mobileNumber = StorageManager.readData(StorageKeys.mobileNumber);
      final userId = StorageManager.readData(StorageKeys.userId);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBG,
      key: scaffoldKey,
      drawer: SideMenuWidget(
        onProfileTap: () {
          setState(() {
            showBottomSheet = true;
          });
        },
      ),
      appBar: CustomAppBar(
        centerTitle: true,
        leadingOnPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        imageName: AppImagesKey.logo,
        leadingIcon: AppIcons.menuIcons,
        actionIcon: AppIcons.walletIcons,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView(
              children: [
                10.height,
                BannerWidget(
                  bannerState: state.headerBanners ?? [],
                ),
                10.height,
                CategoriesWidget(
                  state: state.categories ?? [],
                  customerId: state.homeResponse.data?.customer?.id ?? 0,
                ),
                10.height,
                NewArrivalInfoWidget(
                  state: state.newArrival,
                ),
                10.height,
                BestSellerWidget(
                  state: state.bestSeller ?? [],
                ),
                10.height,
                BannerWidget(
                  bannerState: state.middleBanners ?? [],
                ),
                10.height,
                SeasonalWidget(
                  state: state.seasonal ?? [],
                ),
                10.height,
                BannerWidget(
                  bannerState: state.footerBanners ?? [],
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
