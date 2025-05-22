import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';

abstract class ViewAllProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ViewAllProductInitial extends ViewAllProductState {}

class ViewAllProductLoading extends ViewAllProductState {}

class ViewAllProductLoaded extends ViewAllProductState {
  final ViewProductResponse viewProductResponse;

  ViewAllProductLoaded({required this.viewProductResponse});

  @override
  List<Object?> get props => [viewProductResponse];
}

class ViewAllProductError extends ViewAllProductState {
  final String errorMessage;

  ViewAllProductError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
