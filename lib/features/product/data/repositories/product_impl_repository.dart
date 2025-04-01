import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/product/data/repositories/product_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/view_category_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/view_category_use_case.dart';

class ProductImplRepository extends ProductRepository {
  final ProductRemoteRepo productRemoteRepo;

  ProductImplRepository({required this.productRemoteRepo});

  @override
  Future<Either<Failure, ViewCategoryResponse>> viewAllCategories(
      {required ViewCategoryParam param}) async {
    try {
      final result = await productRemoteRepo.viewAllCategories(param: param);
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesProductResponse>> categoriesProduct(
      {required CategoriesProductParam param}) async {
    try {
      final result = await productRemoteRepo.categoriesProduct(param: param);
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
