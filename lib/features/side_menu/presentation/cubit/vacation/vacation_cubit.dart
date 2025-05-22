import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/use_case/vacation_use_case.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../home/presentation/cubit/home_cubit.dart';

class VacationCubit extends Cubit<VacationState> {
  final VacationUseCase vacationUseCase;

  VacationCubit({required this.vacationUseCase})
      : super(VacationInitial(isSwitched: false));

  Future<void> vacationToggle(bool value) async {
    Get.context?.loaderOverlay.show();
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final status = value ? 1 : 0;

    final result = await vacationUseCase
        .call(VacationParam(customerId: customerId, status: status));

    result.fold(
      (failure) => emit(VacationError(failure.message)),
      (result) async {
        if (result.status == AppString.success) {
          emit(VacationSuccess(isSwitched: value));
          Get.back();
          FunctionalComponent.successMessageSnackbar(
              message: result.message ?? AppString.empty);

          final deviceInfo = DeviceInfoPlugin();
          final packageInfo = await PackageInfo.fromPlatform();
          final androidInfo = await deviceInfo.androidInfo;
          Get.context?.read<HomeCubit>().getHomeData(HomeParam(
                mobileNumber: StorageManager.readData(StorageKeys.mobileNumber),
                userId: StorageManager.readData(StorageKeys.userId),
                type: "app",
                deviceType: "Android",
                devicesModel: androidInfo.model,
                devicesId: androidInfo.id,
                version: packageInfo.version,
              ));
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }
}
