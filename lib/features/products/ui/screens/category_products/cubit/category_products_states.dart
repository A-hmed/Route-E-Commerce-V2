import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class CategoryProductsState {
  late ApiResult<List<Product>> productsApiState;

  CategoryProductsState({required this.productsApiState});

  CategoryProductsState.initial(){
    productsApiState = LoadingApiResult();
  }

  CategoryProductsState copyWith({ApiResult<List<Product>>? productsApiState}) {
    return CategoryProductsState(
      productsApiState: productsApiState ?? this.productsApiState,
    );
  }
}
