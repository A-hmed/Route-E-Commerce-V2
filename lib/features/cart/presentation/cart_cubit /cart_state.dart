import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';

class CartState {
  late ApiResult<Cart> cartApiState;
  Cart? latestCart;

  CartState({required this.cartApiState, this.latestCart});

  CartState.initial() {
    cartApiState = InitialApiResult();
  }

  CartState copyWith({ApiResult<Cart>? cartApiState, Cart? latestCart}) {
    return CartState(
      cartApiState: cartApiState ?? this.cartApiState,
      latestCart: latestCart ?? this.latestCart,
    );
  }
}
