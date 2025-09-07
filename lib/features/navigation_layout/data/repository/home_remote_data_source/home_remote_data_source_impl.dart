import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/repository/home_remote_data_source/home_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network%20/api_services.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/category_response/categories_response.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/products_response/ProductsResponse.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      CategoriesResponse response = await _apiServices.getCategories();
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? subCategoryId,
  }) async {
    try {
      ProductsResponse response =
          categoryId == null
              ? await _apiServices.getProducts()
              : await _apiServices.getProductsOnCategory(categoryId, subCategoryId!);
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  @override
  Future<ApiResult<CategoriesResponse>> getSubCategories(
    String categoryId,
  ) async {
    try {
      CategoriesResponse response = await _apiServices
          .getSubCategoriesOnCategory(categoryId);
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }
}
