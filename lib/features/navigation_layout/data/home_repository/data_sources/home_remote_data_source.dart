import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/products_response.dart';

abstract class HomeRemoteDataSource{
  Future<ApiResult<CategoriesResponse>> loadCategories();
  Future<ApiResult<ProductsResponse>> loadProducts();
}