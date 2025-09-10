import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class CartEntry {
  Product product;
  int quantity;
  double totalProductPrice;
  double price;

  CartEntry({
    required this.product,
    required this.quantity,
    required this.totalProductPrice,
    required this.price,
  });
}
