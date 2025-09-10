import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart.dart';

class CartState{
  late ApiResult<Cart> cartApi;
  Cart? latestCart = null;

  CartState({required this.cartApi, this.latestCart});

  CartState.initial(){
    cartApi = LoadingApiResult();
  }


  CartState copyWith({ApiResult<Cart>? cartApi, Cart? latestCart}) {
    return CartState(
      cartApi: cartApi ?? this.cartApi,
      latestCart: latestCart ?? this.latestCart,
    );
  }
}