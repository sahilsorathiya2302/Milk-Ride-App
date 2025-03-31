import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/register/widgets/city_select_widget.dart';

import 'area_select_widget.dart';

class AddressDetails extends StatefulWidget {
  final Function({
    required String houseNo,
    required String floor,
    required String societyName,
    required String landMark,
    required String city,
    required String cityId,
    required String area,
    required String areaId,
    required String pinCode,
  }) onAddressDetailsChanged;
  final GlobalKey<FormState> formKey;

  const AddressDetails(
      {super.key,
      required this.formKey,
      required this.onAddressDetailsChanged});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  String city = "";
  String area = "";
  int cityId = 0;
  int? areaId;
  final TextEditingController _houseNoController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _societyController = TextEditingController();
  final TextEditingController _landMarkController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    _houseNoController.addListener(_updateAddressDetails);
    _floorController.addListener(_updateAddressDetails);
    _societyController.addListener(_updateAddressDetails);
    _landMarkController.addListener(_updateAddressDetails);
    _pincodeController.addListener(_updateAddressDetails);
    super.initState();
  }

  void _updateAddressDetails() {
    widget.onAddressDetailsChanged(
        houseNo: _houseNoController.text,
        floor: _floorController.text,
        societyName: _societyController.text,
        landMark: _landMarkController.text,
        city: city,
        cityId: cityId.toString(),
        area: area,
        areaId: areaId.toString(),
        pinCode: _pincodeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: CustomText(
                text: AppString.address,
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s18,
              ),
            ),
            25.height,

            Row(
              children: [
                Expanded(
                  child: CustomTitleWithTextField(
                    controller: _houseNoController,
                    validator: (p0) => AppValidation.emptyValue(p0),
                    titleText: AppString.titleHouseNo,
                    hintText: AppString.houseNumber,
                  ),
                ),
                10.width,
                Expanded(
                  child: CustomTitleWithTextField(
                    controller: _floorController,
                    titleText: AppString.titleFloor,
                    hintText: AppString.floor,
                  ),
                ),
              ],
            ),
            11.height,

            CustomTitleWithTextField(
              controller: _societyController,
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleSocietyName,
              hintText: AppString.society,
            ),
            11.height,

            CustomTitleWithTextField(
              controller: _landMarkController,
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleLandMarks,
              hintText: AppString.lendMark,
            ),
            11.height,

            // City
            CustomText(
              text: AppString.titleCity,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w600,
            ),
            5.height,
            CitySelectWidget(
              onValueSelected: (name, id) {
                setState(() {
                  city = name;
                  cityId = id;
                });

                widget.formKey.currentState?.validate();
              },
            ),

            11.height,

            CustomText(
              text: AppString.titleArea,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w600,
            ),
            5.height,
            10.height,
            AreaSelectWidget(
              cityId: cityId,
              onValueSelected: (name, id) {
                setState(() {
                  area = name;
                  areaId = id;
                });
                widget.formKey.currentState?.validate();
              },
              hintText: area.isEmpty ? AppString.area : area,
              preventOpen: city.isEmpty, // Prevent selecting area before city
            ),
            11.height,

            CustomTitleWithTextField(
              controller: _pincodeController,
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titlePinCode,
              hintText: AppString.pinCode,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _houseNoController.dispose();
    _floorController.dispose();
    _societyController.dispose();
    _landMarkController.dispose();
    _pincodeController.dispose();
  }
}
