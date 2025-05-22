import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../../domain/use_case/view_product_use_case.dart';

abstract class ViewProductRemoteRepo {
  Future<ViewProductResponse> viewAllProduct(
      {required ViewAllProductParam param});
}

class ViewProductImplRemoteRepo extends ViewProductRemoteRepo {
  final ApiService apiService;

  ViewProductImplRemoteRepo({required this.apiService});
  @override
  Future<ViewProductResponse> viewAllProduct(
      {required ViewAllProductParam param}) async {
    return await apiService.allProduct(
        categoryId: param.categoryId,
        customerId: param.customerId,
        page: param.page,
        length: param.length,
        keyword: param.searchKeyword);
  }
}
