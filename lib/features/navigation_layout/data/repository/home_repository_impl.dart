import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/category_mapper.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/repository/home_remote_data_source/home_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/repository/home_repository.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/category_response/categories_response.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/products_response/ProductsResponse.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final CategoryMapper _categoryMapper;
  final ProductMapper _productMapper;

  HomeRepositoryImpl(
    this._homeRemoteDataSource,
    this._categoryMapper,
    this._productMapper,
  );

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      ApiResult<CategoriesResponse> result =
          await _homeRemoteDataSource.getCategories();
      if (result.hasData) {
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.myData.data ?? []),
        );
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult("Something went wrong please try again later");
    }
  }

  @override
  Future<ApiResult<List<Product>>> getProducts({
    String? categoryId,
    String? subCategoryId,
  }) async {
    try {
      ApiResult<ProductsResponse> result = await _homeRemoteDataSource
          .getProducts(categoryId: categoryId, subCategoryId: subCategoryId);
      if (result.hasData) {
        return SuccessApiResult(
          _productMapper.fromDataModels(result.myData.data ?? []),
        );
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult("Something went wrong please try again later");
    }
  }

  @override
  Future<ApiResult<List<Category>>> getSubCategories(String categoryId) async {
    try {
      ApiResult<CategoriesResponse> result = await _homeRemoteDataSource
          .getSubCategories(categoryId);
      if (result.hasData) {
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.myData.data ?? []),
        );
      } else {
        return ErrorApiResult(result.myErrorMessage);
      }
    } catch (e) {
      return ErrorApiResult("Something went wrong please try again later");
    }
  }
}
