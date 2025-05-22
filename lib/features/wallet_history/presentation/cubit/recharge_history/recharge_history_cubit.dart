import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/recharge_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/recharge_history/recharge_history_state.dart';

import '../../../domain/entities/recharge_history_data.dart';
import '../../../domain/entities/recharge_history_info_data.dart';

class RechargeHistoryCubit extends Cubit<RechargeHistoryState> {
  final RechargeHistoryUseCase rechargeHistoryUseCase;

  RechargeHistoryCubit({required this.rechargeHistoryUseCase})
      : super(RechargeHistoryInitial(selectDate: null));

  void setCurrent() {
    final now = DateTime.now();
    emit(state.copyWith(selectDate: now));
  }

  void setSelectedDate(DateTime date) {
    emit(state.copyWith(selectDate: date));
  }

  void refreshRechargeHistory(int customerId) {
    emit(state.copyWith(selectDate: null));
    rechargeHistory(customerId: customerId);
  }

  List<RechargeHistoryInfoData> dateWiseRechargeHistory(
      {required String date,
      required List<RechargeHistoryData> allHistoryData}) {
    RechargeHistoryData? filteredHistory = allHistoryData.firstWhere(
      (history) => history.date == date,
      orElse: () => RechargeHistoryData(date: date, data: []),
    );

    return filteredHistory.data ?? [];
  }

  Future<void> rechargeHistory({required int customerId}) async {
    final result = await rechargeHistoryUseCase
        .call(RechargeHistoryParam(customerId: customerId));

    result.fold(
      (failure) {
        emit(RechargeHistoryError(
          errorMessage: failure.message,
          selectDate: state.selectDate,
        ));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(RechargeHistoryLoaded(
            rechargeHistoryResponse: result,
            selectDate: state.selectDate,
          ));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
  }
}
