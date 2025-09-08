import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_entry.dart';

class Cart{
  num totalPrice;
  Map<String, CartEntry> entries;
  int totalNumberOfItems;

  Cart({required this.entries,
    required this.totalPrice, required this.totalNumberOfItems});
}