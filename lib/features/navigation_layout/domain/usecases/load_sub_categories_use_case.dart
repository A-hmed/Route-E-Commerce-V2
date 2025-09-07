import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/repository/home_repository.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';

@injectable
class LoadSubCategoriesUseCase {
  final HomeRepository _homeRepository;

  LoadSubCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<Category>>> call(String categoryId) => _homeRepository.getSubCategories(categoryId);
}
