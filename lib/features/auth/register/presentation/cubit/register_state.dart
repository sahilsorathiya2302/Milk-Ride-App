import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/entities/register_response.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;

  RegisterSuccess({required this.registerResponse});
  @override
  List<Object?> get props => [registerResponse];
}

final class RegisterFailure extends RegisterState {
  final RegisterResponse registerResponse;

  RegisterFailure({required this.registerResponse});
  @override
  List<Object?> get props => [registerResponse];
}

final class RegisterError extends RegisterState {
  final String errorMessage;

  RegisterError({required this.errorMessage});
}
