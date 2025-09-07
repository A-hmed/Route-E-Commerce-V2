import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

abstract class HomeRepository{
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Category>>> getSubCategories(String categoryId);
  Future<ApiResult<List<Product>>> getProducts({
    String? categoryId,
    String? subCategoryId,
  });
}