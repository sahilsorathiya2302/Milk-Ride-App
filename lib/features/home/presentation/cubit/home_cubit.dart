import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/customer.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_data.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());

  Customer? customerData;
  HomeData? homeData;

  Future<void> getHomeData(HomeParam param) async {
    emit(HomeLoading());
    final response = await homeUseCase.call(HomeParam(
        mobileNumber: param.mobileNumber,
        userId: param.userId,
        type: param.type,
        deviceType: param.deviceType,
        devicesModel: param.devicesModel,
        version: param.version,
        devicesId: param.devicesId));

    response.fold(
      (failure) {
        emit(HomeError(failure: failure.message.toString()));
      },
      (response) {
        emit(HomeLoading());
        if (response.status == AppString.success) {
          customerData = response.data?.customer;
          homeData = response.data;
          emit(HomeLoaded(homeResponse: response));
        } else if (response.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: AppString.error, message: response.message.toString());
        }
      },
    );
  }

  Future<void> getHome() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    final androidInfo = await deviceInfo.androidInfo;
    await getHomeData(
      HomeParam(
        mobileNumber: StorageManager.readData(StorageKeys.mobileNumber),
        userId: StorageManager.readData(StorageKeys.userId),
        type: "app",
        deviceType: "Android",
        devicesModel: androidInfo.model,
        devicesId: androidInfo.id,
        version: packageInfo.version,
      ),
    );
  }
}
