import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Category>>> loadCategories();

  Future<ApiResult<List<Category>>> loadSubCategories(String categoryId);

  Future<ApiResult<List<Product>>> loadProducts({String? categoryId, String? subCategoryId});
}
