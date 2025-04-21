import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';

class ProductUseCase implements UseCase<ProductResponse, ProductParam> {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});
  @override
  Future<Either<Failure, ProductResponse>> call(ProductParam param) {
    return productRepository.product(param: param);
  }
}

class ProductParam {
  final int customerId;
  final int productId;

  ProductParam({required this.customerId, required this.productId});
}
