import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';

class CategoriesState {
  late ApiResult<List<Category>> categoriesApiState;
  late ApiResult<List<Category>> subCategoriesApiState;
  late int selectedCategoryIndex;

  CategoriesState({
    required this.categoriesApiState,
    required this.selectedCategoryIndex,
    required this.subCategoriesApiState,
  });

  CategoriesState.initial() {
    categoriesApiState = InitialApiResult();
    subCategoriesApiState = InitialApiResult();
    selectedCategoryIndex = 0;
  }

  CategoriesState copyWith({
    ApiResult<List<Category>>? categoriesApiState,
    int? selectedCategoryIndex,
    ApiResult<List<Category>>? subCategoriesApiState,
  }) {
    return CategoriesState(
      categoriesApiState: categoriesApiState ?? this.categoriesApiState,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      subCategoriesApiState: subCategoriesApiState ?? this.subCategoriesApiState
    );
  }
}
