import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/network/model/response/cart/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<ApiResult<CartResponse>> getCart();

  Future<ApiResult<CartResponse>> addProductToCart(String productId);

  Future<ApiResult<CartResponse>> removeProductFromCart(String productId);

  Future<ApiResult<CartResponse>> updateProductCartQuantity(
    String productId,
    int quantity,
  );
}
