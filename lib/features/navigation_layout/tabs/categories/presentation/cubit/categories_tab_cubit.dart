import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecases/load_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecases/load_sub_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_tab_state.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_cubit_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesTabState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final LoadSubCategoriesUseCase _loadSubCategoriesUseCase;

  CategoriesCubit(this._loadCategoriesUseCase, this._loadSubCategoriesUseCase)
    : super(CategoriesTabState.initial());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesApiState: LoadingApiResult()));
    var result = await _loadCategoriesUseCase();
    emit(state.copyWith(categoriesApiState: result));
    if(result.hasData){
      loadSubCategories(result.myData[0].id ?? "");
    }

  }

  Future<void> loadSubCategories(String categoryId) async {
    emit(state.copyWith(subCategoriesApiState: LoadingApiResult()));
    var result = await _loadSubCategoriesUseCase(categoryId);
    emit(state.copyWith(subCategoriesApiState: result));
  }

  void onCategoryClick(int index) {
    emit(state.copyWith(selectedIndex: index));
    loadSubCategories(state.categoriesApiState.myData[index].id ?? "");
  }
}
