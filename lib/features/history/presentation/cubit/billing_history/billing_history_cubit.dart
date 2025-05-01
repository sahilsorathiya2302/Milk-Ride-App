import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/history/presentation/cubit/billing_history/billing_history_state.dart';

class BillingHistoryCubit extends Cubit<BillingHistoryState> {
  final BillingHistoryUseCase billingHistoryUseCase;
  BillingHistoryCubit({required this.billingHistoryUseCase})
      : super(BillingHistoryInitial());

  Future<void> billingHistory({required int customerId}) async {
    final result = await billingHistoryUseCase
        .call(BillingHistoryParam(customerId: customerId));

    result.fold(
      (failure) {
        emit(BillingHistoryError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(BillingHistoryLoaded(billingHistoryResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
  }
}
