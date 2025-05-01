import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/history/domain/entities/recharge_history_response.dart';

class RechargeHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RechargeHistoryInitial extends RechargeHistoryState {}

class RechargeHistoryLoading extends RechargeHistoryState {}

class RechargeHistoryLoaded extends RechargeHistoryState {
  final RechargeHistoryResponse rechargeHistoryResponse;

  RechargeHistoryLoaded({required this.rechargeHistoryResponse});

  @override
  List<Object?> get props => [rechargeHistoryResponse];
}

class RechargeHistoryError extends RechargeHistoryState {
  final String errorMessage;

  RechargeHistoryError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
