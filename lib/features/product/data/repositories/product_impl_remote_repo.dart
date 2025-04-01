import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/view_category_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../../domain/entities/view_category_response.dart';

abstract class ProductRemoteRepo {
  Future<ViewCategoryResponse> viewAllCategories(
      {required ViewCategoryParam param});

  Future<CategoriesProductResponse> categoriesProduct(
      {required CategoriesProductParam param});
}

class ProductImplRemoteRepo extends ProductRemoteRepo {
  final ApiService apiService;

  ProductImplRemoteRepo({required this.apiService});
  @override
  Future<ViewCategoryResponse> viewAllCategories(
      {required ViewCategoryParam param}) {
    return apiService.viewAllCategories(
      userId: param.userId,
    );
  }

  @override
  Future<CategoriesProductResponse> categoriesProduct(
      {required CategoriesProductParam param}) {
    return apiService.categoryProduct(
      customerId: param.customerId,
      categoryId: param.categoryId,
    );
  }
}
