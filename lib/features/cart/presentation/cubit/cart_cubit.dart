import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repository/cart_repository.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cubit/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartRepository cartRepository;

  CartCubit(this.cartRepository) : super(CartState.initial());

  Future<void> loadCart() async {
    emit(state.copyWith(cartApi: LoadingApiResult()));
    var result = await cartRepository.getCart();
    emit(
      state.copyWith(
        cartApi: result,
        latestCart: result.hasData ? result.myData : null,
      ),
    );
  }

  Future<void> addProductToCart(String productId) async {
    emit(state.copyWith(cartApi: LoadingApiResult()));
    var result = await cartRepository.addProduct(productId);
    emit(
      state.copyWith(
        cartApi: result,
        latestCart: result.hasData ? result.myData : null,
      ),
    );
  }

  Future<void> removeProductFromCart(String productId) async {
    emit(state.copyWith(cartApi: LoadingApiResult()));
    var result = await cartRepository.removeProduct(productId);
    emit(
      state.copyWith(
        cartApi: result,
        latestCart: result.hasData ? result.myData : null,
      ),
    );
  }

  Future<void> updateProductQuantity(String productId, int quantity) async {
    emit(state.copyWith(cartApi: LoadingApiResult()));
    var result = await cartRepository.updateProductQuantity(
      productId,
      quantity,
    );
    emit(
      state.copyWith(
        cartApi: result,
        latestCart: result.hasData ? result.myData : null,
      ),
    );
  }
}
