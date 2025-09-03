import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecase/load_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecase/load_subcategories.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final LoadSubCategoriesUseCase _loadSubCategoriesUseCase;

  CategoriesCubit(this._loadCategoriesUseCase, this._loadSubCategoriesUseCase)
    : super(CategoriesState.initial());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesApiState: LoadingApiResult()));
    var result = await _loadCategoriesUseCase();
    emit(state.copyWith(categoriesApiState: result));
    if(result.hasData){
      loadSubCategories(result.getData[0].id);
    }
  }

  void updateSelectedCategoryIndex(int index) {
    emit(state.copyWith(selectedCategoryIndex: index));
    loadSubCategories(state.categoriesApiState.getData[index].id);
  }

  Future<void> loadSubCategories(String category) async {
    emit(state.copyWith(subCategoriesApiState: LoadingApiResult()));
    var result = await _loadSubCategoriesUseCase(category);
    emit(state.copyWith(subCategoriesApiState: result));
  }
}
