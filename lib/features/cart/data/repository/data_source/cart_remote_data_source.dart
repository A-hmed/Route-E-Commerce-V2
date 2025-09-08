import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/cart/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<ApiResult<CartResponse>> getCart();

  Future<ApiResult<CartResponse>> addProduct(String productId);

  Future<ApiResult<CartResponse>> removeProduct(String productId);

  Future<ApiResult<CartResponse>> updateProductQuantity(String productId, int count);
}
