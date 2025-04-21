import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';

class CategoriesProductUseCase
    implements UseCase<CategoriesProductResponse, CategoriesProductParam> {
  final ProductRepository productRepository;

  CategoriesProductUseCase({required this.productRepository});
  @override
  Future<Either<Failure, CategoriesProductResponse>> call(
      CategoriesProductParam param) async {
    return await productRepository.categoriesProduct(param: param);
  }
}

class CategoriesProductParam {
  final int customerId;
  final int categoryId;

  CategoriesProductParam({required this.customerId, required this.categoryId});
}
