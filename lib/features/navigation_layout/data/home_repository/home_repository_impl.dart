import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/constatns.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/home_repository/data_sources/home_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/category_mapper.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/repository/home_repository.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/products_response.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final ProductMapper _productMapper;
  final CategoryMapper _categoryMapper;

  HomeRepositoryImpl(
    this._remoteDataSource,
    this._categoryMapper,
    this._productMapper,
  );

  @override
  Future<ApiResult<List<Category>>> loadCategories() async {
    try {
      ApiResult<CategoriesResponse> result = await _remoteDataSource
          .loadCategories();
      if (result.hasData) {
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.getData.data),
        );
      } else {
        return ErrorApiResult(result.getError);
      }
    } catch (e) {
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<ApiResult<List<Product>>> loadProducts({String? categoryId, String? subCategoryId}) async {
    try {
      ApiResult<ProductsResponse> result = await _remoteDataSource
          .loadProducts(categoryId: categoryId, subCategoryId: subCategoryId);
      if (result.hasData) {
        return SuccessApiResult(
          _productMapper.fromDataModels(result.getData.data ?? []),
        );
      } else {
        return ErrorApiResult(result.getError);
      }
    } catch (e) {
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<ApiResult<List<Category>>> loadSubCategories(String categoryId) async {
    try {
      ApiResult<CategoriesResponse> result = await _remoteDataSource
          .loadSubCategories(categoryId);
      if (result.hasData) {
        return SuccessApiResult(
          _categoryMapper.fromDataModels(result.getData.data),
        );
      } else {
        return ErrorApiResult(result.getError);
      }
    } catch (e) {
      return ErrorApiResult(UnknownError(Constants.defaultErrorMessage));
    }
  }
}
