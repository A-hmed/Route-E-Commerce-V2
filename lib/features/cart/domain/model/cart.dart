import 'package:route_e_commerce_v2/features/cart/domain/model/cart_entry.dart';

class Cart{
  Map<String, CartEntry> products;
  double totalCartPrice;

  Cart({required this.products, required this.totalCartPrice});

}