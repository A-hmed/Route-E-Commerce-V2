import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_entry.dart';

class Cart{
  num totalPrice;
  ///Key -> Product id
  Map<String, CartEntry> entries;
  int totalNumberOfItems;

  Cart({required this.entries,
    required this.totalPrice, required this.totalNumberOfItems});


  bool isProductInCart(String productId) => entries[productId] != null;

  int? getProductQuantity(String productId) => entries[productId]?.quantity;
}