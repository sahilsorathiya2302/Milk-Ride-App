import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/variant_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/view_category_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/variants_use_case.dart';

import '../usecase/view_category_use_case.dart';

abstract class ProductRepository {
  Future<Either<Failure, ViewCategoryResponse>> viewAllCategories(
      {required ViewCategoryParam param});

  Future<Either<Failure, CategoriesProductResponse>> categoriesProduct(
      {required CategoriesProductParam param});

  Future<Either<Failure, ProductResponse>> product(
      {required ProductParam param});
  Future<Either<Failure, VariantResponse>> variant(
      {required VariantsParam param});
}
