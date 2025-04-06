import 'package:equatable/equatable.dart';

abstract class DeliveryTypeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeliveryTypeInitial extends DeliveryTypeState {}

class DeliveryTypeUpdated extends DeliveryTypeState {
  final String deliveryType;

  DeliveryTypeUpdated({required this.deliveryType});

  @override
  List<Object?> get props => [deliveryType];
}
