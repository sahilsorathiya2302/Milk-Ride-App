import 'package:flutter/cupertino.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/widgets/user_personal_details.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';

class UserPersonalDetailsSection extends StatelessWidget {
  final dynamic customer;

  const UserPersonalDetailsSection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.address,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s14,
        ),
        10.height,
        UserPersonalDetails(
          title: AppString.profileEmail,
          info: (customer?.email == null || customer?.email == AppString.email)
              ? AppString.notFound
              : customer?.email ?? AppString.empty,
        ),
        10.height,
        UserPersonalDetails(
          title: AppString.profileMobileNumber,
          info: customer?.mobileNumber?.toString() ?? AppString.empty,
        ),
        10.height,
        UserPersonalDetails(
          title: AppString.registerAddress,
          info: customer?.address?.toString() ?? AppString.empty,
        ),
        10.height,
        UserPersonalDetails(
          title: AppString.hubName,
          info: customer?.hub?.toString() ?? AppString.empty,
        ),
        10.height,
        UserPersonalDetails(
          title: AppString.areaName,
          info: customer?.area?.toString() ?? AppString.empty,
        ),
      ],
    );
  }
}
