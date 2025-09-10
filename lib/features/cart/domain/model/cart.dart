import 'package:route_e_commerce_v2/features/cart/domain/model/cart_entry.dart';

class Cart{
  Map<String, CartEntry> cartEntries;
  double totalCartPrice;

  Cart({required this.cartEntries, required this.totalCartPrice});

}