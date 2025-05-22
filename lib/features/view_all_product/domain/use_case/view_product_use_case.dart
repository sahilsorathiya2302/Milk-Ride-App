import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/repositories/view_product_repository.dart';

class ViewProductUseCase
    implements UseCase<ViewProductResponse, ViewAllProductParam> {
  final ViewProductRepository viewProductRepository;

  ViewProductUseCase({required this.viewProductRepository});
  @override
  Future<Either<Failure, ViewProductResponse>> call(
      ViewAllProductParam param) async {
    return await viewProductRepository.viewAllProduct(param: param);
  }
}

class ViewAllProductParam {
  final String? categoryId;
  final int customerId;
  final int page;
  final int length;
  final String? searchKeyword;

  ViewAllProductParam(
      {required this.categoryId,
      required this.customerId,
      required this.searchKeyword,
      required this.page,
      required this.length});
}
