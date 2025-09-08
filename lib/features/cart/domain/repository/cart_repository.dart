import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart.dart';

abstract class CartRepository{
  Future<ApiResult<Cart>> getCart();

  Future<ApiResult<Cart>> addProduct(String productId);

  Future<ApiResult<Cart>> removeProduct(String productId);

  Future<ApiResult<Cart>> updateProductQuantity(String productId, int count);

}