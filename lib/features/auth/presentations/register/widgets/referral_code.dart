import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/register/widgets/sources_widget.dart';

import '../../../../../core/constants/app_string.dart';

class ReferralCode extends StatefulWidget {
  final Function(String referralCode, String agentCode, String find)
      onAddressDetailsChanged;
  const ReferralCode({super.key, required this.onAddressDetailsChanged});

  @override
  State<ReferralCode> createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  final TextEditingController _referralCodeController = TextEditingController();
  final TextEditingController _agentCodeController = TextEditingController();
  String sourceName = "";
  String sourceId = "";

  @override
  void initState() {
    super.initState();
    _referralCodeController.addListener(_updateReferralDetails);
    _agentCodeController.addListener(_updateReferralDetails);
  }

  void _updateReferralDetails() {
    widget.onAddressDetailsChanged(
      _referralCodeController.text,
      _agentCodeController.text,
      sourceId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
              text: AppString.referralCode,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s18,
            ),
          ),
          30.height,
          CustomTitleWithTextField(
            titleText: AppString.titleReferralCode,
            hintText: AppString.hintReferralCode,
            controller: _referralCodeController,
          ),
          11.height,
          CustomTitleWithTextField(
            titleText: AppString.titleAgentCode,
            hintText: AppString.agentCode,
            controller: _agentCodeController,
          ),
          11.height,
          CustomText(
            text: AppString.titleFind,
            fontSize: AppTextSize.s14,
            fontWeight: FontWeight.w600,
          ),
          5.height,
          SourcesWidget(
            onValueSelected: (name, id) {
              setState(() {
                sourceName = name;
                sourceId = id;
              });
              _updateReferralDetails();
            },
          ),
          11.height,
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _referralCodeController.dispose();
    _agentCodeController.dispose();
  }
}
