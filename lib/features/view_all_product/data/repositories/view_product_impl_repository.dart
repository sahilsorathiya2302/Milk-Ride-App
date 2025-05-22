import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/view_all_product/data/repositories/view_product_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/repositories/view_product_repository.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';

class ViewProductImplRepository extends ViewProductRepository {
  final ViewProductRemoteRepo viewProductRemoteRepo;

  ViewProductImplRepository({required this.viewProductRemoteRepo});
  @override
  Future<Either<Failure, ViewProductResponse>> viewAllProduct(
      {required ViewAllProductParam param}) async {
    try {
      final result = await viewProductRemoteRepo.viewAllProduct(param: param);

      print("====>$result");
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
