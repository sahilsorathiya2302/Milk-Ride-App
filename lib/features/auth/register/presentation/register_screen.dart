import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/features/auth/register/presentation/widgets/address_details.dart';
import 'package:milk_ride_live_wc/features/auth/register/presentation/widgets/personal_details_widgets.dart';
import 'package:milk_ride_live_wc/features/auth/register/presentation/widgets/referral_code.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int activePage = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PersonalDetailsWidgets(
        formKey: _formKey,
      ),
      AddressDetails(
        formKey: _formKey,
      ),
      ReferralCode(),
    ];
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.height,
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
                  setState(() {
                    activePage = index;
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
              ),
            ),
            20.height,
            SizedBox(
              height: context.height / 1.35,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index],
              ),
            ),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (activePage < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                    setState(() {
                      activePage++; // Update activePage to keep in sync
                    });
                  }
                }
              },
              text: activePage == pages.length - 1
                  ? AppString.submit
                  : AppString.next,
            ),
          ],
        ).paddingSymmetric(horizontal: 20)));
  }
}
