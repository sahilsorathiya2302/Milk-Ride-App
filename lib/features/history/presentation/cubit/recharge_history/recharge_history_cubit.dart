import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/history/domain/use_case/recharge_history_use_case.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/recharge_history/recharge_history_state.dart';

class RechargeHistoryCubit extends Cubit<RechargeHistoryState> {
  final RechargeHistoryUseCase rechargeHistoryUseCase;
  RechargeHistoryCubit({required this.rechargeHistoryUseCase})
      : super(RechargeHistoryInitial());

  Future<void> rechargeHistory({required int customerId}) async {
    final result = await rechargeHistoryUseCase
        .call(RechargeHistoryParam(customerId: customerId));

    result.fold(
      (failure) {
        emit(RechargeHistoryError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(RechargeHistoryLoaded(rechargeHistoryResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
  }
}
