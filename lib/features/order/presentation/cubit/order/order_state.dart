import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';

class OrderState extends Equatable {
  final DateTime baseDate;
  final DateTime selectedDate;
  final int index;
  final String cancelReason;
  final int? reasonId;

  const OrderState({
    required this.baseDate,
    required this.selectedDate,
    required this.index,
    required this.cancelReason,
    required this.reasonId,
  });

  List<DateTime> get surroundingDates {
    return List.generate(15, (i) => baseDate.subtract(Duration(days: 7 - i)));
  }

  OrderState copyWith({
    DateTime? baseDate,
    DateTime? selectedDate,
    int? index,
    String? cancelReason,
    int? reasonId,
  }) {
    return OrderState(
      baseDate: baseDate ?? this.baseDate,
      selectedDate: selectedDate ?? this.selectedDate,
      index: index ?? this.index,
      cancelReason: cancelReason ?? this.cancelReason,
      reasonId: reasonId ?? this.reasonId,
    );
  }

  @override
  List<Object?> get props => [baseDate, selectedDate, index, cancelReason];
}

class OrderInitial extends OrderState {
  const OrderInitial({
    required super.baseDate,
    required super.selectedDate,
    required super.index,
    required super.cancelReason,
    required super.reasonId,
  });

  @override
  List<Object?> get props => [baseDate, selectedDate, index];
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState({
    required super.baseDate,
    required super.selectedDate,
    required super.index,
    required super.cancelReason,
    required super.reasonId,
  });

  @override
  List<Object?> get props => [baseDate, selectedDate, index, cancelReason];
}

class OrderLoadedState extends OrderState {
  final OrderResponse orderResponse;

  const OrderLoadedState({
    required super.baseDate,
    required super.selectedDate,
    required super.index,
    required this.orderResponse,
    required super.cancelReason,
    required super.reasonId,
  });

  @override
  OrderLoadedState copyWith({
    DateTime? baseDate,
    DateTime? selectedDate,
    int? index,
    String? cancelReason,
    OrderResponse? orderResponse,
    int? reasonId,
  }) {
    return OrderLoadedState(
      baseDate: baseDate ?? this.baseDate,
      selectedDate: selectedDate ?? this.selectedDate,
      index: index ?? this.index,
      orderResponse: orderResponse ?? this.orderResponse,
      cancelReason: cancelReason ?? this.cancelReason,
      reasonId: reasonId ?? this.reasonId,
    );
  }

  @override
  List<Object?> get props =>
      [orderResponse, baseDate, selectedDate, index, cancelReason];
}

class OrderErrorState extends OrderState {
  final String errorMessage;

  const OrderErrorState({
    required super.baseDate,
    required super.selectedDate,
    required super.index,
    required this.errorMessage,
    required super.cancelReason,
    required super.reasonId,
  });

  @override
  List<Object?> get props =>
      [errorMessage, baseDate, selectedDate, index, cancelReason];
}
