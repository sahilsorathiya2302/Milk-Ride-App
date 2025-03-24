import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final SignInResponse? signInResponse;
  final OtpResponse? otpResponse;
  final ResendOtpResponse? resendOtpResponse;

  AuthSuccess({
    this.resendOtpResponse,
    this.signInResponse,
    this.otpResponse,
  });
  @override
  List<Object?> get props => [signInResponse, otpResponse, resendOtpResponse];
}

class AuthFailure extends AuthState {
  final String? message;

  AuthFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
