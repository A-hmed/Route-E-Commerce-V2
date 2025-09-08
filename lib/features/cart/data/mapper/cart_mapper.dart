import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_entry.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/network/model/response/cart/cart_entry_dm.dart';
import 'package:route_e_commerce_v2/features/network/model/response/cart/cart_response.dart';

@injectable
class CartMapper {
  ProductMapper productMapper;

  CartMapper(this.productMapper);

  Cart cartResponseToCart(CartResponse cartResponse) {
    // var entries2 =  cart.cartEntries.map(cartEntryDMToCartEntry).toList();
    // entries2.forEach((entry){})
    Map<String, CartEntry> entries = {};
    cartResponse.cart?.cartEntries?.forEach((entry) {
      entries[entry.product!.id] = cartEntryDMToCartEntry(entry);
    });

    return Cart(
      entries: entries,
      totalNumberOfItems: cartResponse.numOfCartItems?.toInt() ?? 0,
      totalPrice: cartResponse.cart?.totalCartPrice ?? 0,
    );
  }

  CartEntry cartEntryDMToCartEntry(CartEntryDM cartEntry) {
    var quantity = cartEntry.count ?? 0;
    var product = productMapper.fromDataModel(cartEntry.product!);
    return CartEntry(
      product: product,
      quantity: quantity,
      totalProductPrice: quantity * product.price,
    );
  }
}
