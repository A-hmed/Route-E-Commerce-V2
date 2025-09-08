import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/constatns.dart';
import 'package:route_e_commerce_v2/features/cart/data/cart_repository/data_source%20/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/cart/data/mapper/cart_mapper.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  CartMapper mapper;
  CartRemoteDataSource dataSource;
  CartRepositoryImpl(this.mapper, this.dataSource);

  @override
  Future<ApiResult<Cart>> addProductToCart(String productId) async{
    try{
      var result = await dataSource.addProductToCart(productId);
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));
      }else {
        return ErrorApiResult(result.getError);
      }
    }catch(e){
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<ApiResult<Cart>> getCart() async {
   // try{
      var result = await dataSource.getCart();
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));
      }else {
        return ErrorApiResult(result.getError);
      }
    // }catch(e){
    //   return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    // }
  }

  @override
  Future<ApiResult<Cart>> removeProductFromCart(String productId)async {
    try{
      var result = await dataSource.removeProductFromCart(productId);
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));
      }else {
        return ErrorApiResult(result.getError);
      }
    }catch(e){
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<ApiResult<Cart>> updateProductCartQuantity(String productId, int quantity)async {
    try{
      var result = await dataSource.updateProductCartQuantity(productId, quantity);
      if(result.hasData){
        return SuccessApiResult(mapper.cartResponseToCart(result.getData));
      }else {
        return ErrorApiResult(result.getError);
      }
    }catch(e){
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }
}