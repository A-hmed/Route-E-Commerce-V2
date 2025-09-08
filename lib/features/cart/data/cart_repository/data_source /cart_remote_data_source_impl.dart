import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/data/cart_repository/data_source%20/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network/api/commerce_services.dart';
import 'package:route_e_commerce_v2/features/network/model/request/cart/add_product_request.dart';
import 'package:route_e_commerce_v2/features/network/model/request/cart/update_product_quantity_request.dart';
import 'package:route_e_commerce_v2/features/network/model/response/cart/cart_response.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  CommerceServices commerceServices;

  CartRemoteDataSourceImpl(this.commerceServices);

  @override
  Future<ApiResult<CartResponse>> addProductToCart(String productId) async {
    try {
      await commerceServices.addProductToCart(AddProductRequest(productId));
     return getCart();

    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async {
   // try {
      return SuccessApiResult(await commerceServices.getCart());
    // } catch (e) {
    //   return ErrorApiResult(ServerError(e.toString()));
    // }
  }

  @override
  Future<ApiResult<CartResponse>> removeProductFromCart(
    String productId,
  ) async {
    try {
      return SuccessApiResult(
        await commerceServices.removeProductFromCart(productId),
      );
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateProductCartQuantity(
    String productId,
    int quantity,
  ) async {
    try {
      return SuccessApiResult(
        await commerceServices.updateProductQuantity(
          UpdateProductQuantityRequest(quantity.toString()),
          productId,
        ),
      );
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
