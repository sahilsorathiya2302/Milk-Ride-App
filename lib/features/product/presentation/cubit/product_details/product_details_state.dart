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
  final double selectedPrice;
  final int selectedQuantity;

  ProductDetailsLoaded({
    required this.productResponse,
    required this.selectedPrice,
    required this.selectedQuantity,
  });

  List<FilteredPackages>? get filteredPackages =>
      productResponse.data?.filteredPackages;

  @override
  List<Object?> get props => [productResponse, selectedPrice, selectedQuantity];
}

class ProductOfferSelected extends ProductDetailsState {
  final int selectedIndex;

  ProductOfferSelected(this.selectedIndex);
}
