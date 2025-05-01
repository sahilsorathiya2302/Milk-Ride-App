import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/customer.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());

  Customer? customerData;

  Future<void> getHomeData(HomeParam param) async {
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
          emit(HomeLoaded(homeResponse: response));
        } else if (response.status == AppString.error) {
          FunctionalComponent.errorSnackbar(
              title: AppString.error, message: response.message.toString());
        }
      },
    );
  }
}
