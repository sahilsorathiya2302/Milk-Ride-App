import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';

abstract class RechargeHistoryState extends Equatable {
  final DateTime? selectDate;

  const RechargeHistoryState({required this.selectDate});

  RechargeHistoryState copyWith({Object? selectDate});
  @override
  List<Object?> get props => [selectDate];
}

class RechargeHistoryInitial extends RechargeHistoryState {
  const RechargeHistoryInitial({required super.selectDate});

  @override
  RechargeHistoryInitial copyWith({Object? selectDate}) {
    return RechargeHistoryInitial(
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate];
}

class RechargeHistoryLoading extends RechargeHistoryState {
  const RechargeHistoryLoading({required super.selectDate});

  @override
  RechargeHistoryLoading copyWith({Object? selectDate}) {
    return RechargeHistoryLoading(
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate];
}

class RechargeHistoryLoaded extends RechargeHistoryState {
  final RechargeHistoryResponse rechargeHistoryResponse;

  const RechargeHistoryLoaded({
    required this.rechargeHistoryResponse,
    required super.selectDate,
  });

  @override
  RechargeHistoryLoaded copyWith({
    RechargeHistoryResponse? rechargeHistoryResponse,
    Object? selectDate,
  }) {
    return RechargeHistoryLoaded(
      rechargeHistoryResponse:
          rechargeHistoryResponse ?? this.rechargeHistoryResponse,
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [selectDate, rechargeHistoryResponse];
}

class RechargeHistoryError extends RechargeHistoryState {
  final String errorMessage;

  const RechargeHistoryError({
    required this.errorMessage,
    required super.selectDate,
  });

  @override
  RechargeHistoryError copyWith({
    String? errorMessage,
    Object? selectDate,
  }) {
    return RechargeHistoryError(
      errorMessage: errorMessage ?? this.errorMessage,
      selectDate: selectDate is DateTime? ? selectDate : this.selectDate,
    );
  }

  @override
  List<Object?> get props => [errorMessage, selectDate];
}
