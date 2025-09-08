import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/data/repository/data_source/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network%20/api_services.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/cart/AddProductToCartRequest.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/cart/UpdateProductQuantityRequest.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/cart/cart_response.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiServices apiServices;

  CartRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResult<CartResponse>> addProduct(String productId) async {
    try {
      await apiServices.addToCart(
        AddProductToCartRequest(productId: productId),
      );
      return getCart();
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      return SuccessApiResult(await apiServices.getCart());
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  @override
  Future<ApiResult<CartResponse>> removeProduct(String productId) async {
    try {
      return SuccessApiResult(await apiServices.removeFromCart(productId));
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateProductQuantity(
    String productId,
    int count,
  ) async {
    try {
      return SuccessApiResult(
        await apiServices.updateQuantityInCart(
          productId,
          UpdateProductQuantityRequest(count: count),
        ),
      );
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }
}
