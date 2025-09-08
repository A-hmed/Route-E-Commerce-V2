import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/constants.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/data/mapper/cart_mapper.dart';
import 'package:route_e_commerce_v2/features/cart/data/repository/data_source/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartMapper mapper;

  CartRepositoryImpl(this.mapper, this.cartRemoteDataSource);

  @override
  Future<ApiResult<Cart>> addProduct(String productId) async {
    try {
      var result = await cartRemoteDataSource.addProduct(productId);
      if (result.hasData) {
        return SuccessApiResult(mapper.cartDMToCart(result.myData.cart!));
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult(Constants.defaultErrorMessage);
    }
  }

  @override
  Future<ApiResult<Cart>> getCart() async {
    try {
      var result = await cartRemoteDataSource.getCart();
      if (result.hasData) {
        return SuccessApiResult(mapper.cartDMToCart(result.myData.cart!));
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult(Constants.defaultErrorMessage);
    }
  }

  @override
  Future<ApiResult<Cart>> removeProduct(String productId) async {
    try {
      var result = await cartRemoteDataSource.removeProduct(productId);
      if (result.hasData) {
        return SuccessApiResult(mapper.cartDMToCart(result.myData.cart!));
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult(Constants.defaultErrorMessage);
    }
  }

  @override
  Future<ApiResult<Cart>> updateProductQuantity(
    String productId,
    int count,
  ) async {
    try {
      var result = await cartRemoteDataSource.updateProductQuantity(
        productId,
        count,
      );
      if (result.hasData) {
        return SuccessApiResult(mapper.cartDMToCart(result.myData.cart!));
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult(Constants.defaultErrorMessage);
    }
  }
}
