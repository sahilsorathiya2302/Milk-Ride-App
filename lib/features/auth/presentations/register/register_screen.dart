import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_state.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/register/widgets/address_details.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/register/widgets/personal_details_widgets.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/register/widgets/referral_code.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cubit/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  final dynamic getArgument;
  const RegisterScreen({super.key, required this.getArgument});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int activePage = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  void initState() {
    context.read<RegionsSourcesCubit>().regionSources(
          mobileNumber: widget.getArgument[StorageKeys.mobileNumber],
          userId: widget.getArgument[StorageKeys.userId],
        );
    super.initState();
  }

  String name = "";
  String email = "";
  String gender = "";
  String houseNo = "";
  String floor = "";
  String societyName = "";
  String landMark = "";
  String city = "";
  String cityId = "";
  String area = "";
  String areaId = "";
  String pinCode = "";
  String referralCode = "";
  String agentCode = "";
  String find = "";

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PersonalDetailsWidgets(
        onPersonalDetailsChanged: (name, email, gender) {
          this.name = name;
          this.email = email;
          this.gender = gender;
        },
        formKey: _formKeys[0],
      ),
      AddressDetails(
        onAddressDetailsChanged: (
            {required houseNo,
            required floor,
            required societyName,
            required landMark,
            required city,
            required cityId,
            required areaId,
            required area,
            required pinCode}) {
          this.houseNo = houseNo;
          this.floor = floor;
          this.societyName = societyName;
          this.landMark = landMark;
          this.city = city;
          this.cityId = cityId;
          this.area = area;
          this.areaId = areaId;
          this.pinCode = pinCode;
        },
        formKey: _formKeys[1],
      ),
      ReferralCode(
        onAddressDetailsChanged: (referralCode, agentCode, find) {
          this.referralCode = referralCode;
          this.agentCode = agentCode;
          this.find = find;
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            70.height,
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: WormEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 8.h,
                  dotWidth: 90.w,
                  type: WormType.underground,
                ),
                onDotClicked: (index) {
                  if (index < activePage) {
                    _navigateToPage(index);
                  }
                },
              ),
            ),
            30.height,
            SizedBox(
              height: context.height / 1.35,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index],
              ),
            ),
            30.height,
            BlocBuilder<RegionsSourcesCubit, RegionsSourcesState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    _handleNextOrSubmit();
                  },
                  text: activePage == pages.length - 1
                      ? AppString.submit
                      : AppString.next,
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }

  void _navigateToPage(int index) {
    if (index < activePage) {
      setState(() {
        activePage = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _handleNextOrSubmit() {
    if (activePage == _formKeys.length) {
      _submitRegistration();
      return;
    }

    if (_formKeys[activePage].currentState?.validate() ?? true) {
      if (activePage < 2) {
        setState(() {
          activePage++;
        });

        _pageController.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _submitRegistration();
      }
    }
  }

  void _submitRegistration() async {
    for (int i = 0; i < _formKeys.length; i++) {
      if (!(_formKeys[i].currentState?.validate() ?? true)) {
        return;
      }
    }

    double latitude = 0.0;
    double longitude = 0.0;

    try {
      String locationInput = "$area, $city";

      List<Location> locations = await locationFromAddress(locationInput);

      if (locations.isNotEmpty) {
        latitude = locations[0].latitude;
        longitude = locations[0].longitude;
      }
    } catch (e) {
      print("Geocoding failed: $e");
      Get.snackbar("Error", "Couldn't get location from city/area");
      return;
    }

    context.read<AuthCubit>().register(
          name: name,
          email: email,
          sourceId: find,
          areaId: areaId,
          houseNo: houseNo,
          floor: floor,
          society: societyName,
          landMark: landMark,
          city: latitude.toString(),
          area: longitude.toString(),
          pinCode: pinCode,
          regionId: cityId,
          userId: widget.getArgument[StorageKeys.userId],
          referrerCode: referralCode,
          agentCode: agentCode,
          deliveryType: "morning",
          gender: gender,
          mobileNumber: widget.getArgument[ArgumentKey.mobileNumber],
        );
  }
}
