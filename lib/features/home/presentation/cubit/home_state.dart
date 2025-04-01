import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse homeResponse;

  HomeLoaded({required this.homeResponse});
  List<Object?> get prop => [homeResponse];
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
  List<Object?> get prop => [errorMessage];
}
