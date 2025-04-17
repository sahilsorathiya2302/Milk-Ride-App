import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/variant_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';

class VariantsUseCase implements UseCase<VariantResponse, VariantsParam> {
  final ProductRepository productRepository;

  VariantsUseCase({required this.productRepository});
  @override
  Future<Either<Failure, VariantResponse>> call(VariantsParam param) async {
    return await productRepository.variant(param: param);
  }
}

class VariantsParam {
  final int customerId;
  final int productId;

  VariantsParam({required this.customerId, required this.productId});
}
