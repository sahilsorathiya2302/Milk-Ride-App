import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_state.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/functional_component.dart';
import '../../../domain/usecases/area_use_case.dart';

class AreaCubit extends Cubit<AreaState> {
  final AreaUseCase areaUseCase;
  AreaCubit({required this.areaUseCase}) : super(AreaInitial());

  void resetArea() {
    emit(AreaInitial());
  }

  Future<void> getArea({required int id}) async {
    Get.context!.loaderOverlay.show();
    final result = await areaUseCase.call(AreaParam(id: id));
    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(
            title: AppString.error, message: failure.message);
        emit(AreaError(errorMessage: failure.message));
      },
      (response) {
        emit(AreaLoadedState(areaResponse: response));
      },
    );
    Get.context!.loaderOverlay.hide();
  }
}
