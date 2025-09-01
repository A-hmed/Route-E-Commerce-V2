import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';

import '../repository/home_repository.dart';

@injectable
class LoadCategoriesUseCase {
  final HomeRepository _homeRepository;

  LoadCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<Category>>> call() => _homeRepository.loadCategories();
}
