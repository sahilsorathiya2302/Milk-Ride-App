import 'package:equatable/equatable.dart';

import '../../../domain/entities/view_category_response.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final ViewCategoryResponse viewCategoryResponse;

  CategoriesLoaded({required this.viewCategoryResponse});
  @override
  List<Object?> get props => [viewCategoryResponse];
}

class CategoriesError extends CategoriesState {
  final String errorMessage;

  CategoriesError({required this.errorMessage});
}
