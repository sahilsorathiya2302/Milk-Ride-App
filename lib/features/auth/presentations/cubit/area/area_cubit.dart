import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_state.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/functional_component.dart';
import '../../../domain/usecases/area_use_case.dart';

class AreaCubit extends Cubit<AreaState> {
  final AreaUseCase areaUseCase;
  AreaCubit({required this.areaUseCase}) : super(AreaInitial());

  void resetArea() {
    emit(AreaInitial()); // Reset the area state
  }

  Future<void> getArea({required int id}) async {
    final result = await areaUseCase.call(AreaParam(id: id));
    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(AppString.error, failure.message);
        emit(AreaError(errorMessage: failure.message));
      },
      (response) {
        emit(AreaLoadedState(areaResponse: response));
      },
    );
  }
}
