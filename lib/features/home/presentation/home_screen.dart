import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_app_bar.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/banner_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/best_seller_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/categories_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/home_shimmer_place_holder.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/new_arrival_info_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/seasonal_widget.dart';
import 'package:milk_ride_live_wc/features/home/presentation/widget/vacation_message_widget.dart';

import '../../../core/ui_component/custom_dialog_box.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const HomeScreen({super.key, this.scaffoldKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBottomSheet = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final shouldExit = await showConfirmationDialog(
          title: AppString.appCloseConfirm,
          subTitle: AppString.appCloseConfirmMessage,
          onPressed: () {
            SystemNavigator.pop();
          },
        );

        if (shouldExit ?? false) {
          SystemNavigator.pop();
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.homeBG,
              appBar: CustomAppBar(
                centerTitle: true,
                leadingOnPressed: () {
                  widget.scaffoldKey?.currentState?.openDrawer();
                },
                imageName: AppImagesKey.logo,
                leadingIcon: AppIcons.menuIcons,
                actionIcon: AppIcons.walletIcons,
                actionOnPressed: () {
                  Get.toNamed(AppRoutesNames.walletScreen);
                },
                text: state is HomeLoaded
                    ? state.customer?.wallet
                    : AppString.zero,
              ),
              body: _homeData(state));
        },
      ),
    );
  }

  Widget _homeData(HomeState state) {
    if (state is HomeLoading) {
      return HomeShimmerPlaceHolder();
    } else if (state is HomeError) {
      return NetworkFailCard(
        message: state.failure.toString(),
        onPressed: () {
          context.read<HomeCubit>().getHome();
        },
      );
    } else if (state is HomeLoaded) {
      final customerId = state.homeResponse.data?.customer?.id ?? 0;
      return RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          context.read<HomeCubit>().getHome();
        },
        child: ListView(
          children: [
            state.headerBanners!.isNotEmpty ? 10.height : SizedBox(),
            state.homeResponse.data?.isVacation == 1
                ? VacationMessageWidget()
                : SizedBox(),
            state.headerBanners!.isNotEmpty ? 10.height : SizedBox(),
            state.headerBanners!.isNotEmpty
                ? BannerWidget(bannerState: state.headerBanners ?? [])
                : SizedBox(),
            10.height,
            CategoriesWidget(
              configImage:
                  state.homeResponse.data?.config?.logoUrl ?? AppString.empty,
              state: state.categories ?? [],
              customerId: customerId,
            ),
            10.height,
            NewArrivalInfoWidget(
              state: state.homeResponse.data!.newArrival,
              customerId: state.homeResponse.data?.customer?.id ?? 0,
            ),
            10.height,
            state.middleBanners!.isNotEmpty
                ? BannerWidget(bannerState: state.middleBanners ?? [])
                : SizedBox(),
            10.height,
            BestSellerWidget(
              state: state.bestSeller ?? [],
              customerId: state.homeResponse.data?.customer?.id ?? 0,
            ),
            10.height,
            SeasonalWidget(
              state: state.seasonal ?? [],
              customerId: state.homeResponse.data?.customer?.id ?? 0,
            ),
            10.height,
            state.footerBanners!.isNotEmpty
                ? BannerWidget(bannerState: state.footerBanners ?? [])
                : SizedBox(),
            10.height,
          ],
        ),
      );
    } else {
      return const Center(child: HomeShimmerPlaceHolder());
    }
  }
}
