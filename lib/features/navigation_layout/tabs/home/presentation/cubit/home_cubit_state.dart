import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class HomeCubitState {
  late ApiResult<List<Product>> productState;
  late ApiResult<List<Category>> categoriesState;

  HomeCubitState({required this.productState, required this.categoriesState});

  HomeCubitState.initial() {
    productState = InitialApiResult();
    categoriesState = InitialApiResult();
  }

  HomeCubitState copyWith({
    ApiResult<List<Product>>? productState,
    ApiResult<List<Category>>? categoriesState,
  }
  ) {
    return HomeCubitState(
      productState: productState ?? this.productState,
      categoriesState: categoriesState ?? this.categoriesState,
    );
  }
}
