import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_response.dart';

abstract class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  final WalletResponse walletResponse;

  WalletLoaded({required this.walletResponse});

  @override
  List<Object> get props => [walletResponse];
}

class WalletError extends WalletState {
  final String errorMessage;

  WalletError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
