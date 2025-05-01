import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/history/domain/entities/billing_history_response.dart';

class BillingHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BillingHistoryInitial extends BillingHistoryState {}

class BillingHistoryLoading extends BillingHistoryState {}

class BillingHistoryLoaded extends BillingHistoryState {
  final BillingHistoryResponse billingHistoryResponse;

  BillingHistoryLoaded({required this.billingHistoryResponse});
  @override
  List<Object?> get props => [billingHistoryResponse];
}

class BillingHistoryError extends BillingHistoryState {
  final String errorMessage;

  BillingHistoryError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
