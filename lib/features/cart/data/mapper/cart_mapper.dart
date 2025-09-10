import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart_entry.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/cart/cart_dm.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/cart/cart_entry_dm.dart';

@injectable
class CartMapper {
  ProductMapper productMapper;

  CartMapper(this.productMapper);

  Cart cartDMToCart(CartDM cart) {
    // var entries = cart.cartEntries?.map(cartEntryDMToCartEntry).toList();
    var map = <String, CartEntry>{};
    // for(var entry in entries){
    //
    // }
    cart.cartEntries?.forEach((entry) {
      map[entry.product?.id ?? ""] = cartEntryDMToCartEntry(entry);
    });
    return Cart(
      cartEntries: map,
      totalCartPrice: cart.totalCartPrice?.toDouble() ?? 0,
    );
  }

  CartEntry cartEntryDMToCartEntry(CartEntryDM cartEntry) {
    var quantity = cartEntry.count?.toInt() ?? 0;

    var price = cartEntry.price?.toDouble() ?? 0;
    print("cartEntryDMToCartEntry: ${price}");
    return CartEntry(
      product: productMapper.fromDataModel(cartEntry.product!),
      quantity: quantity,
      price: price,
      totalProductPrice: quantity * price,
    );
  }
}
