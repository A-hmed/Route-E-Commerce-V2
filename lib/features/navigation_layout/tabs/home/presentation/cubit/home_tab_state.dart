import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class HomeTabState {
  late ApiResult<List<Category>> categoriesState;
  late ApiResult<List<Product>> productsState;

  HomeTabState({required this.productsState, required this.categoriesState});

  HomeTabState.initial() {
    categoriesState = InitialApiResult();
    productsState = LoadingApiResult();
  }

  HomeTabState copyWith({
    ApiResult<List<Category>>? categoriesState,
    ApiResult<List<Product>>? productsState,
  }) {
    return HomeTabState(
      productsState: productsState ?? this.productsState,
      categoriesState: categoriesState ?? this.categoriesState,
    );
  }
}
