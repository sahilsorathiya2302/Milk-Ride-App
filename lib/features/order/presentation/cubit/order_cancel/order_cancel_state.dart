import 'package:equatable/equatable.dart';

abstract class OrderCancelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderCancelInitial extends OrderCancelState {}

class OrderCancelError extends OrderCancelState {
  final String errorMessage;

  OrderCancelError({required this.errorMessage});
}
