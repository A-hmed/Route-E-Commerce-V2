import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/home_repository/data_sources/home_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network/api/commerce_services.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/products_response.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final CommerceServices _commerceServices;

  HomeRemoteDataSourceImpl(this._commerceServices);

  @override
  Future<ApiResult<CategoriesResponse>> loadCategories() async {
    try {
      var categoriesResponse = await _commerceServices.loadCategories();
      return SuccessApiResult(categoriesResponse);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> loadProducts({
    String? categoryId,
    String? subCategoryId,
  }) async {
    print(
      "HomeRemoteDataSourceImpl, loadProducts, categoryId: $categoryId, subCategoryId: $subCategoryId",
    );
    try {
      var productsResponse = categoryId != null
          ? await _commerceServices.loadProductsByCategory(
              categoryId,
              subCategoryId,
            )
          : await _commerceServices.loadProducts();
      return SuccessApiResult(productsResponse);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<CategoriesResponse>> loadSubCategories(
    String categoryId,
  ) async {
    try {
      var categoriesResponse = await _commerceServices.loadSubCategories(
        categoryId,
      );
      return SuccessApiResult(categoriesResponse);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
