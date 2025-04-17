import 'package:equatable/equatable.dart';

import '../../../domain/entities/categories_product_response.dart';

class CategoriesProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CategoriesProductInitial extends CategoriesProductState {}

final class CategoriesProductLoading extends CategoriesProductState {}

final class CategoriesProductLoaded extends CategoriesProductState {
  final CategoriesProductResponse categoriesProductResponse;

  CategoriesProductLoaded({required this.categoriesProductResponse});

  @override
  List<Object?> get props => [categoriesProductResponse];
}

final class CategoriesProductError extends CategoriesProductState {
  final String errorMessage;

  CategoriesProductError({required this.errorMessage});
}
