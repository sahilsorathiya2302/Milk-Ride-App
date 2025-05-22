import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_state.dart';

import '../../../core/routes/app_routes_names.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkUserAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = StorageManager.readData(StorageKeys.tokenKey);

    if (token != null) {
      Get.offAllNamed(AppRoutesNames.mainScreen);
    } else {
      Get.offAllNamed(AppRoutesNames.signInScreen);
    }
  }
}
