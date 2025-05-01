import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';

abstract class SubscriptionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionLoaded extends SubscriptionState {
  final SubscriptionResponse subscriptionResponse;

  SubscriptionLoaded({
    required this.subscriptionResponse,
  });

  @override
  List<Object?> get props => [
        subscriptionResponse,
      ];
}

class SubscriptionError extends SubscriptionState {
  final String errorMessage;

  SubscriptionError({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
