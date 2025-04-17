import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_item_remove_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_quantity_update_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class CartRemoteRepo {
  Future<CartResponse> addToCart({required int customerId});
  Future<ApiResponseModel> removeCartItem({required CartItemRemoveParam param});
  Future<ApiResponseModel> updateCartItemQty(
      {required CartQuantityUpdateParam param});
}

class CartImplRemoteRepo extends CartRemoteRepo {
  final ApiService apiService;
  CartImplRemoteRepo({required this.apiService});

  @override
  Future<CartResponse> addToCart({required int customerId}) async {
    return await apiService.addToCart(customerId: customerId);
  }

  @override
  Future<ApiResponseModel> removeCartItem(
      {required CartItemRemoveParam param}) async {
    return await apiService.removeCartItem(cartId: param.cartId);
  }

  @override
  Future<ApiResponseModel> updateCartItemQty(
      {required CartQuantityUpdateParam param}) async {
    return apiService.updateCartItemQty(cart: param.cart);
  }
}
