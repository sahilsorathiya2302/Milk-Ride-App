import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_response.dart';

abstract class BillingHistoryState extends Equatable {
  final DateTime? selectDate;

  const BillingHistoryState({required this.selectDate});
  BillingHistoryState copyWith({Object? selectDate});
  @override
  List<Object?> get props => [selectDate];
}

class BillingHistoryInitial extends BillingHistoryState {
  const BillingHistoryInitial({required super.selectDate});
  @override
  BillingHistoryInitial copyWith({Object? selectDate}) {
    return BillingHistoryInitial(
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate];
}

class BillingHistoryLoading extends BillingHistoryState {
  const BillingHistoryLoading({required super.selectDate});
  @override
  BillingHistoryLoading copyWith({Object? selectDate}) {
    return BillingHistoryLoading(
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate];
}

class BillingHistoryLoaded extends BillingHistoryState {
  final BillingHistoryResponse billingHistoryResponse;

  const BillingHistoryLoaded(
      {required this.billingHistoryResponse, required super.selectDate});

  @override
  BillingHistoryLoaded copyWith({
    BillingHistoryResponse? rechargeHistoryResponse,
    Object? selectDate,
  }) {
    return BillingHistoryLoaded(
      billingHistoryResponse:
          rechargeHistoryResponse ?? this.billingHistoryResponse,
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [billingHistoryResponse, selectDate];
}

class BillingHistoryError extends BillingHistoryState {
  final String errorMessage;

  const BillingHistoryError(
      {required this.errorMessage, required super.selectDate});

  @override
  BillingHistoryError copyWith({
    String? errorMessage,
    Object? selectDate,
  }) {
    return BillingHistoryError(
      errorMessage: errorMessage ?? this.errorMessage,
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate, errorMessage];
}
