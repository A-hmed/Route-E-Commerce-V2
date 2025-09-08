import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/product_dm.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

@injectable
class ProductMapper {
  Product fromDataModel(ProductDM product) {
    return Product(
      id: product.id,
      title: product.title ?? "",
      description: product.description ?? "",
      price: product.price ?? 0,
      priceAfterDiscount: product.priceAfterDiscount ?? 0,
      imageCover: product.imageCover ?? "",
      images: product?.images ?? [],
      categoryId: product.category?.id ?? "",
      brandId: product.brand?.id ?? "",
      ratingsAverage: product.ratingsAverage ?? 0,
      ratingsQuantity: product.ratingsQuantity ?? 0,
      quantity: product.quantity ?? 0,
      availableColors: product.availableColors ?? [],
    );
  }

  List<Product> fromDataModels(List<ProductDM> products) {
    return products.map(fromDataModel).toList();
  }
}
