import 'package:equatable/equatable.dart';

abstract class VacationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VacationInitial extends VacationState {
  final bool? isSwitched;
  VacationInitial({this.isSwitched});

  @override
  List<Object?> get props => [isSwitched];
}

class VacationSuccess extends VacationState {
  final bool isSwitched;
  VacationSuccess({required this.isSwitched});
  @override
  List<Object?> get props => [isSwitched];
}

class VacationError extends VacationState {
  final String message;
  VacationError(this.message);
  @override
  List<Object?> get props => [message];
}
