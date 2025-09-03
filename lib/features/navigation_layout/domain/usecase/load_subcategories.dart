import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';

import '../repository/home_repository.dart';

@injectable
class LoadSubCategoriesUseCase {
  final HomeRepository _homeRepository;

  LoadSubCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<Category>>> call(String categoryId) =>
      _homeRepository.loadSubCategories(categoryId);
}
