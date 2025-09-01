import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/category_response/categories_response.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/products_response/ProductsResponse.dart';

abstract class HomeRemoteDataSource{
  Future<ApiResult<CategoriesResponse>> getCategories();
  Future<ApiResult<ProductsResponse>> getProducts();
}