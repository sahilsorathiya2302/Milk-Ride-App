import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_up_response.dart';

abstract class RegionsSourcesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegionsSourcesInitial extends RegionsSourcesState {}

class RegionsSourcesLoading extends RegionsSourcesState {}

class RegionsSourcesLoaded extends RegionsSourcesState {
  final RegionsSourcesResponse regionsSourcesResponse;

  RegionsSourcesLoaded({
    required this.regionsSourcesResponse,
  });

  @override
  List<Object?> get props => [regionsSourcesResponse];
}

class RegionsSourcesError extends RegionsSourcesState {
  final String errorMessage;

  RegionsSourcesError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
