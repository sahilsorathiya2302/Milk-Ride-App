import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/core/ui_component/select_item_app_bar.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_state.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_validation.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';
import '../../../../../core/utils/functional_component.dart';
import '../../cubit/area/area_cubit.dart';
import '../../cubit/regions_and_sources/regions_sources_cubit.dart';

class CitySelectWidget extends StatefulWidget {
  final Function(String name, int id) onValueSelected;

  final bool preventOpen;

  const CitySelectWidget({
    super.key,
    required this.onValueSelected,
    this.preventOpen = false,
  });

  @override
  State<CitySelectWidget> createState() => _CityAndAreaSelectWidgetState();
}

class _CityAndAreaSelectWidgetState extends State<CitySelectWidget> {
  String? selectedValue;
  int? cityId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionsSourcesCubit, RegionsSourcesState>(
      builder: (context, state) {
        if (state is RegionsSourcesError) {
          return NetworkFailCard(message: state.errorMessage);
        } else if (state is RegionsSourcesLoaded) {
          final items = state.regionsSourcesResponse.data.regions;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                readOnly: true,
                onTap: () {
                  if (widget.preventOpen) {
                    FunctionalComponent.errorSnackbar(
                        title: AppString.error,
                        message: AppString.citySelectMessage);
                    return;
                  }
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppBorderRadius.r14),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        children: [
                          SelectItemAppBar(
                            title: AppString.selectCity,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final region = items[index];
                                return ListTile(
                                  title: CustomText(
                                    text: region.name,
                                    fontSize: AppTextSize.s14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context, {
                                      "id": region.id,
                                      "name": region.name,
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        selectedValue = value["name"];
                        cityId = value["id"];
                      });
                      Get.context!.read<AreaCubit>().getArea(id: cityId!);
                      widget.onValueSelected(selectedValue!, cityId!);
                    }
                  });
                },
                validator: (value) => AppValidation.emptyValue(selectedValue),
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppString.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: AppTextSize.s0),
                  hintText: selectedValue ?? AppString.city,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintStyle: TextStyle(
                    fontSize: AppTextSize.s14,
                    color: AppColors.grey,
                  ),
                  enabledBorder: buildOutlineInputBorder(
                      color: AppColors.black, radius: AppBorderRadius.r10),
                  focusedBorder: buildOutlineInputBorder(
                      color: AppColors.black, radius: AppBorderRadius.r10),
                  errorBorder: buildOutlineInputBorder(
                      color: AppColors.red, radius: AppBorderRadius.r10),
                  focusedErrorBorder: buildOutlineInputBorder(
                      color: AppColors.red, radius: AppBorderRadius.r10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    required double radius,
    required Color color,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
