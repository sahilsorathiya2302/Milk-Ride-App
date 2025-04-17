import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/regions_sources_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_state.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/functional_component.dart';

class RegionsSourcesCubit extends Cubit<RegionsSourcesState> {
  final RegionsSourcesUseCase regionsSourcesUseCase;

  RegionsSourcesCubit({
    required this.regionsSourcesUseCase,
  }) : super(RegionsSourcesInitial());

  Future<void> regionSources({
    required String mobileNumber,
    required int userId,
  }) async {
    emit(RegionsSourcesLoading());
    final result = await regionsSourcesUseCase
        .call(RegionsSourcesParam(mobileNumber: mobileNumber, userId: userId));

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(
            title: AppString.error, message: failure.message);
        emit(RegionsSourcesError(errorMessage: failure.message));
      },
      (response) {
        if (response.status == AppString.success) {
          emit(RegionsSourcesLoaded(regionsSourcesResponse: response));
        } else {
          FunctionalComponent.successSnackbar(
            title: response.message.toString(),
            message: response.data.toString(),
          );
        }
      },
    );
  }
}
