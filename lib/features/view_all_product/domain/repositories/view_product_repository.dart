import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';

abstract class ViewProductRepository {
  Future<Either<Failure, ViewProductResponse>> viewAllProduct(
      {required ViewAllProductParam param});
}
