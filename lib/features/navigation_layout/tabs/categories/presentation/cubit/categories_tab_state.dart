import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';

class CategoriesTabState {
  int selectedIndex = 0;
  late ApiResult<List<Category>> categoriesApiState;
  late ApiResult<List<Category>> subCategoriesApiState;

  CategoriesTabState({
    required this.categoriesApiState,
    required this.selectedIndex,
    required this.subCategoriesApiState,
  });

  CategoriesTabState.initial() {
    categoriesApiState = InitialApiResult();
    selectedIndex = 0;
    subCategoriesApiState = InitialApiResult();
  }

  CategoriesTabState copyWith({
    ApiResult<List<Category>>? categoriesApiState,
    ApiResult<List<Category>>? subCategoriesApiState,
    int? selectedIndex,
  }) {
    return CategoriesTabState(
      categoriesApiState: categoriesApiState ?? this.categoriesApiState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      subCategoriesApiState:
          subCategoriesApiState ?? this.subCategoriesApiState,
    );
  }
}
