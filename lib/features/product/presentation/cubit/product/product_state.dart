import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoadedState extends ProductState {
  final CategoriesProductResponse categoriesProductResponse;

  ProductLoadedState({
    required this.categoriesProductResponse,
  });
  @override
  List<Object?> get props => [categoriesProductResponse];
}
