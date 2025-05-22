import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponse profileResponse;

  ProfileLoaded({required this.profileResponse});
  @override
  List<Object?> get props => [profileResponse];
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
