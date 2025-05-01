import 'package:equatable/equatable.dart';

class AddBalanceState extends Equatable {
  final String selectedMethod;
  final String selectDate;
  final String amount;

  const AddBalanceState({
    this.selectedMethod = "online",
    this.selectDate = "",
    this.amount = "1",
  });

  AddBalanceState copyWith({
    String? selectedMethod,
    String? selectDate,
    String? amount,
  }) {
    return AddBalanceState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      selectDate: selectDate ?? this.selectDate,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [
        selectedMethod,
        selectDate,
        amount,
      ];
}

class AddBalanceError extends AddBalanceState {
  final String errorMessage;

  const AddBalanceError({
    super.selectedMethod,
    super.selectDate,
    super.amount,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [selectedMethod, selectDate, amount, errorMessage];
}
