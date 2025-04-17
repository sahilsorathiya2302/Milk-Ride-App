import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_state.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_validation.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/select_item_app_bar.dart';
import '../../../../../core/utils/functional_component.dart';
import '../../cubit/area/area_cubit.dart';

class AreaSelectWidget extends StatefulWidget {
  final String hintText;
  final int cityId;
  final Function(String name, int id) onValueSelected;
  final bool preventOpen;

  const AreaSelectWidget({
    super.key,
    required this.hintText,
    required this.onValueSelected,
    this.preventOpen = false,
    required this.cityId,
  });

  @override
  State<AreaSelectWidget> createState() => _AreaSelectWidgetState();
}

class _AreaSelectWidgetState extends State<AreaSelectWidget> {
  String? selectedValue;
  int? areaId;

  @override
  void initState() {
    context.read<AreaCubit>().getArea(id: widget.cityId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        if (widget.preventOpen) {
          FunctionalComponent.errorSnackbar(
            title: AppString.error,
            message: AppString.citySelectMessage,
          );
          return;
        }

        final result = await showModalBottomSheet<Map<String, dynamic>>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppBorderRadius.r14),
            ),
          ),
          builder: (context) {
            return BlocBuilder<AreaCubit, AreaState>(
              builder: (context, state) {
                if (state is AreaError) {
                  return NetworkFailCard(message: state.errorMessage);
                } else if (state is AreaLoadedState) {
                  final item = state.areaResponse;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SelectItemAppBar(
                        title: AppString.selectArea,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            final area = item[index];
                            return ListTile(
                              title: CustomText(
                                text: area.name ?? "",
                                fontSize: AppTextSize.s14,
                                fontWeight: FontWeight.w700,
                              ),
                              onTap: () {
                                Navigator.pop(context, {
                                  'name': area.name,
                                  'id': area.id,
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('An Occurred Error');
                }
              },
            );
          },
        );

        if (result != null) {
          setState(() {
            selectedValue = result['name'];
            areaId = result['id'];
          });
          widget.onValueSelected(selectedValue!, areaId!);
        }
      },
      validator: (value) => AppValidation.emptyValue(selectedValue),
      style: TextStyle(
        color: AppColors.black,
        fontFamily: AppString.fontFamily,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: AppTextSize.s0),
        hintText: selectedValue ?? widget.hintText,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        hintStyle: TextStyle(
          fontSize: AppTextSize.s14,
          color: AppColors.grey,
        ),
        enabledBorder: _buildOutlineInputBorder(AppColors.black),
        focusedBorder: _buildOutlineInputBorder(AppColors.black),
        errorBorder: _buildOutlineInputBorder(AppColors.red),
        focusedErrorBorder: _buildOutlineInputBorder(AppColors.red),
        border: _buildOutlineInputBorder(AppColors.black),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      borderSide: BorderSide(color: color),
    );
  }
}
