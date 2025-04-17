import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_state.dart';

import '../../../../../core/constants/app_validation.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';

class SourcesWidget extends StatefulWidget {
  final Function(String name, String id) onValueSelected;

  const SourcesWidget({
    super.key,
    required this.onValueSelected,
  });

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  String? selectedValue;
  String? sourceId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionsSourcesCubit, RegionsSourcesState>(
      builder: (context, state) {
        if (state is RegionsSourcesError) {
          return NetworkFailCard(message: state.errorMessage);
        } else if (state is RegionsSourcesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RegionsSourcesLoaded) {
          final items = state.regionsSourcesResponse.data.sources;

          return TextFormField(
            readOnly: true,
            onTap: () async {
              final result = await showModalBottomSheet<Map<String, dynamic>>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppBorderRadius.r14),
                  ),
                ),
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final sources = items[index];
                              return ListTile(
                                title: CustomText(
                                  text: sources.name,
                                  fontSize: AppTextSize.s14,
                                  fontWeight: FontWeight.w700,
                                ),
                                onTap: () {
                                  Navigator.pop(context, {
                                    'name': sources.name,
                                    "id": sources.id,
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );

              if (result != null) {
                setState(() {
                  selectedValue = result['name'];
                  sourceId = result['id'].toString();
                });

                widget.onValueSelected(selectedValue!, sourceId!);
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
              hintText: selectedValue ?? AppString.findAbout,
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
        return const SizedBox();
      },
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      borderSide: BorderSide(color: color),
    );
  }
}
