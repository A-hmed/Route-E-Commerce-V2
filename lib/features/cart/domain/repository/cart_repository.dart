import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<ApiResult<Cart>> getCart();

  Future<ApiResult<Cart>> addProductToCart(String productId);

  Future<ApiResult<Cart>> removeProductFromCart(String productId);

  Future<ApiResult<Cart>> updateProductCartQuantity(
    String productId,
    int quantity,
  );
}
