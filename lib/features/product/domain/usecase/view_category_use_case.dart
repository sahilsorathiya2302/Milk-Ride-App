import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/view_category_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';

class ViewCategoryUseCase
    implements UseCase<ViewCategoryResponse, ViewCategoryParam> {
  final ProductRepository productRepository;

  ViewCategoryUseCase({required this.productRepository});

  @override
  Future<Either<Failure, ViewCategoryResponse>> call(
      ViewCategoryParam param) async {
    return await productRepository.viewAllCategories(param: param);
  }
}

class ViewCategoryParam {
  final int userId;

  ViewCategoryParam({required this.userId});
}
