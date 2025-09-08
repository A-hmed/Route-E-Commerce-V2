import 'package:route_e_commerce_v2/features/network/model/response/products/product_dm.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class CartEntry {
  Product product;
  int quantity;
  num totalProductPrice;

  CartEntry({
    required this.product,
    required this.quantity,
    required this.totalProductPrice,
  });
}
