import 'package:equatable/equatable.dart';

abstract class PauseResumeSubState extends Equatable {
  final String pauseStartDate;
  final String pauseEndDate;

  const PauseResumeSubState({
    required this.pauseStartDate,
    required this.pauseEndDate,
  });

  @override
  List<Object?> get props => [pauseStartDate, pauseEndDate];
}

class PauseResumeSubInitial extends PauseResumeSubState {
  const PauseResumeSubInitial() : super(pauseStartDate: '', pauseEndDate: '');
}

class PauseResumeSubLoading extends PauseResumeSubState {
  const PauseResumeSubLoading({
    required super.pauseStartDate,
    required super.pauseEndDate,
  });

  @override
  List<Object?> get props => [pauseStartDate, pauseEndDate];
}

class PauseResumeSubUpdated extends PauseResumeSubState {
  const PauseResumeSubUpdated({
    required super.pauseStartDate,
    required super.pauseEndDate,
  });
  @override
  List<Object?> get props => [pauseStartDate, pauseEndDate];
}

class PauseResumeSubError extends PauseResumeSubState {
  final String message;

  const PauseResumeSubError({
    required this.message,
    required super.pauseStartDate,
    required super.pauseEndDate,
  });

  @override
  List<Object?> get props => [pauseStartDate, pauseEndDate, message];
}
