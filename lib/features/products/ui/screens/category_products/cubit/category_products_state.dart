import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class CategoryProductsState {
  late ApiResult<List<Product>> productsApiState;

  CategoryProductsState({required this.productsApiState});

  CategoryProductsState.initial() {
    productsApiState = InitialApiResult();
  }

  CategoryProductsState copyWith({ApiResult<List<Product>>? productsApiState}) {
    return CategoryProductsState(
      productsApiState: productsApiState ?? this.productsApiState,
    );
  }
}
