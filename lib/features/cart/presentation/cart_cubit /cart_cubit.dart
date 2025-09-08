import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repository/cart_repository.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartRepository cartRepository;

  CartCubit(this.cartRepository) : super(CartState.initial());

  Future<void> loadCart() async {
    emit(state.copyWith(cartApiState: LoadingApiResult()));
    var result = await cartRepository.getCart();
    emit(state.copyWith(cartApiState: result));
    if (result.hasData) {
      emit(state.copyWith(latestCart: result.getData));
    }
  }

  Future<void> addProductToCart(String productId) async {
    emit(state.copyWith(cartApiState: LoadingApiResult()));
    var result = await cartRepository.addProductToCart(productId);
    emit(state.copyWith(cartApiState: result));
    if (result.hasData) {
      emit(state.copyWith(latestCart: result.getData));
    }
  }

  Future<void> removeProduct(String productId) async {
    emit(state.copyWith(cartApiState: LoadingApiResult()));
    var result = await cartRepository.removeProductFromCart(productId);
    emit(state.copyWith(cartApiState: result));
    if (result.hasData) {
      emit(state.copyWith(latestCart: result.getData));
    }
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    emit(state.copyWith(cartApiState: LoadingApiResult()));
    var result = await cartRepository.updateProductCartQuantity(
      productId,
      quantity,
    );
    emit(state.copyWith(cartApiState: result));
    if (result.hasData) {
      emit(state.copyWith(latestCart: result.getData));
    }
  }
}
