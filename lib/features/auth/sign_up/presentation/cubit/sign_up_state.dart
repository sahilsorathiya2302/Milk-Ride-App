import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponse;

  SignUpSuccess({required this.signUpResponse});
  @override
  List<Object?> get props => [signUpResponse];
}

class SignUpFail extends SignUpState {
  final String message;

  SignUpFail({required this.message});
  @override
  List<Object?> get props => [message];
}

class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
