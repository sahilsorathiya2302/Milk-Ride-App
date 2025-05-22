import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_data.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_info_data.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/billing_history/billing_history_state.dart';

class BillingHistoryCubit extends Cubit<BillingHistoryState> {
  final BillingHistoryUseCase billingHistoryUseCase;
  BillingHistoryCubit({required this.billingHistoryUseCase})
      : super(BillingHistoryInitial(selectDate: null));

  void setCurrent() {
    final now = DateTime.now();
    emit(state.copyWith(selectDate: now));
  }

  void setSelectedDate(DateTime date) {
    emit(state.copyWith(selectDate: date));
  }

  void refreshBillingHistory(int customerId) {
    emit(state.copyWith(selectDate: null));
    billingHistory(customerId: customerId);
  }

  List<BillingHistoryInfoData> dateWiseRechargeHistory(
      {required String date,
      required List<BillingHistoryData> allHistoryData}) {
    BillingHistoryData? filteredHistory = allHistoryData.firstWhere(
      (history) => history.date == date,
      orElse: () => BillingHistoryData(date: date, data: []),
    );

    return filteredHistory.data ?? [];
  }

  Future<void> billingHistory({required int customerId}) async {
    final result = await billingHistoryUseCase
        .call(BillingHistoryParam(customerId: customerId));

    result.fold(
      (failure) {
        emit(BillingHistoryError(
            errorMessage: failure.message, selectDate: state.selectDate));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(BillingHistoryLoaded(
              billingHistoryResponse: result, selectDate: state.selectDate));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
  }
}
