import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/filtered_packages.dart';

import '../../../domain/entities/product_response.dart';

abstract class ProductDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductResponse productResponse;
  final FilteredPackages? selectedVariant;
  final int quantity;
  final String deliveryType;
  ProductDetailsLoaded({
    required this.productResponse,
    required this.selectedVariant,
    required this.quantity,
    required this.deliveryType,
  });

  @override
  List<Object?> get props =>
      [productResponse, selectedVariant, quantity, deliveryType];
}

class ProductDetailsError extends ProductDetailsState {
  final String failure;

  ProductDetailsError({required this.failure});
  @override
  List<Object?> get props => [failure];
}
