import 'package:equatable/equatable.dart';

abstract class ViewAllProductCategoriesState extends Equatable {
  final String? categoryId;

  const ViewAllProductCategoriesState({this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

final class ViewAllProductCategoriesInitial
    extends ViewAllProductCategoriesState {
  const ViewAllProductCategoriesInitial() : super(categoryId: "");
}

final class ViewAllProductCategorySelected
    extends ViewAllProductCategoriesState {
  const ViewAllProductCategorySelected({required String categoryId})
      : super(categoryId: categoryId);
}
