import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';

class ModifyTemporarilyState extends Equatable {
  final int quantity;
  final String pickType;

  final String startDate;
  final String endDate;

  const ModifyTemporarilyState({
    required this.quantity,
    required this.pickType,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [quantity, pickType, startDate, endDate];
}

class ModifyTemporarilyInitial extends ModifyTemporarilyState {
  static final String today = DateFormat('dd/MM/yyyy').format(DateTime.now());

  ModifyTemporarilyInitial()
      : super(
          quantity: 1,
          pickType: AppString.singleDay,
          startDate: today,
          endDate: '',
        );
}

class ModifyTemporarilyLoading extends ModifyTemporarilyState {
  const ModifyTemporarilyLoading({
    required super.quantity,
    required super.pickType,
    required super.startDate,
    required super.endDate,
  });
}
