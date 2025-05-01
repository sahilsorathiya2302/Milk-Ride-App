import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';

abstract class CreateSubscriptionState extends Equatable {
  final dynamic quantity;
  final String deliveryType;
  final String deliverySchedule;
  final List<int> dayQuantities;
  final String startDate;
  final String endDate;
  final String frequencyType;
  final dynamic frequencyValue;
  final List<int> dayWiseQuantity;

  const CreateSubscriptionState({
    required this.quantity,
    required this.deliveryType,
    required this.deliverySchedule,
    required this.dayQuantities,
    required this.startDate,
    required this.endDate,
    required this.frequencyType,
    required this.frequencyValue,
    required this.dayWiseQuantity,
  });

  @override
  List<Object?> get props => [
        quantity,
        startDate,
        endDate,
        deliveryType,
        deliverySchedule,
        dayQuantities,
        frequencyType,
        frequencyValue,
        dayWiseQuantity,
      ];
}

class CreateSubscriptionInitial extends CreateSubscriptionState {
  const CreateSubscriptionInitial()
      : super(
            quantity: 1,
            deliveryType: 'Morning',
            deliverySchedule: '',
            dayQuantities: const [0, 0, 0, 0, 0, 0, 0],
            frequencyType: '',
            frequencyValue: 0,
            dayWiseQuantity: const [0, 0, 0, 0, 0, 0, 0],
            endDate: "",
            startDate: "");
}

class CreateSubscriptionLoading extends CreateSubscriptionState {
  const CreateSubscriptionLoading({
    required super.quantity,
    required super.deliveryType,
    required super.deliverySchedule,
    required super.dayQuantities,
    required super.frequencyType,
    required super.frequencyValue,
    required super.dayWiseQuantity,
    required super.startDate,
    required super.endDate,
  });

  CreateSubscriptionLoading copyWith({
    int? quantity,
    String? deliveryType,
    String? startDate,
    String? endDate,
    String? deliverySchedule,
    List<int>? dayQuantities,
    String? frequencyType,
    dynamic frequencyValue,
    List<int>? dayWiseQuantity,
  }) {
    return CreateSubscriptionLoading(
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      quantity: quantity ?? this.quantity,
      deliveryType: deliveryType ?? this.deliveryType,
      deliverySchedule: deliverySchedule ?? this.deliverySchedule,
      dayQuantities: dayQuantities ?? this.dayQuantities,
      frequencyType: frequencyType ?? this.frequencyType,
      frequencyValue: frequencyValue ?? this.frequencyValue,
      dayWiseQuantity: dayWiseQuantity ?? this.dayWiseQuantity,
    );
  }
}

class CreateSubscriptionLoaded extends CreateSubscriptionState {
  final ApiResponseModel apiResponseModel;

  const CreateSubscriptionLoaded({
    required this.apiResponseModel,
    required super.quantity,
    required super.startDate,
    required super.endDate,
    required super.deliveryType,
    required super.deliverySchedule,
    required super.dayQuantities,
    required super.frequencyType,
    required super.frequencyValue,
    required super.dayWiseQuantity,
  });

  CreateSubscriptionLoaded copyWith({
    ApiResponseModel? apiResponseModel,
    int? quantity,
    String? deliveryType,
    String? startDate,
    String? endDate,
    String? deliverySchedule,
    List<int>? dayQuantities,
    String? frequencyType,
    dynamic frequencyValue,
    List<int>? dayWiseQuantity,
  }) {
    return CreateSubscriptionLoaded(
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      apiResponseModel: apiResponseModel ?? this.apiResponseModel,
      quantity: quantity ?? this.quantity,
      deliveryType: deliveryType ?? this.deliveryType,
      deliverySchedule: deliverySchedule ?? this.deliverySchedule,
      dayQuantities: dayQuantities ?? this.dayQuantities,
      frequencyType: frequencyType ?? this.frequencyType,
      frequencyValue: frequencyValue ?? this.frequencyValue,
      dayWiseQuantity: dayWiseQuantity ?? this.dayWiseQuantity,
    );
  }

  @override
  List<Object?> get props => [
        apiResponseModel,
        quantity,
        deliveryType,
        startDate,
        endDate,
        deliverySchedule,
        frequencyType,
        frequencyValue,
        dayWiseQuantity
      ];
}

class CreateSubscriptionError extends CreateSubscriptionState {
  const CreateSubscriptionError({
    required super.quantity,
    required super.startDate,
    required super.endDate,
    required super.deliveryType,
    required super.deliverySchedule,
    required super.dayQuantities,
    required super.frequencyType,
    required super.frequencyValue,
    required super.dayWiseQuantity,
  });
  @override
  List<Object?> get props => [
        quantity,
        deliveryType,
        startDate,
        endDate,
        deliverySchedule,
        frequencyType,
        frequencyValue,
        dayWiseQuantity
      ];
}
