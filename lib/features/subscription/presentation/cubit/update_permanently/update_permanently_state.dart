import 'package:equatable/equatable.dart';

class UpdatePermanentlyState extends Equatable {
  final int quantity;

  const UpdatePermanentlyState({required this.quantity});
  @override
  List<Object?> get props => [quantity];
}

class UpdatePermanentlyInitial extends UpdatePermanentlyState {
  const UpdatePermanentlyInitial({required super.quantity});
}

class UpdatePermanentlyLoaded extends UpdatePermanentlyState {
  const UpdatePermanentlyLoaded({required super.quantity});
}
