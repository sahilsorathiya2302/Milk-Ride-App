import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/area_response.dart';

abstract class AreaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AreaInitial extends AreaState {}

class AreaLoadedState extends AreaState {
  final List<AreaResponse> areaResponse;

  AreaLoadedState({required this.areaResponse});

  @override
  List<Object?> get props => [areaResponse];
}

final class AreaError extends AreaState {
  final String errorMessage;

  AreaError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
