import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecase/load_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecase/load_products_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final LoadProductsUseCase _loadProductsUseCase;

  HomeTabCubit(this._loadCategoriesUseCase, this._loadProductsUseCase)
    : super(HomeTabState.initial());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesState: LoadingApiResult()));
    var result = await _loadCategoriesUseCase();
    emit(state.copyWith(categoriesState: result));
  }

  Future<void> loadProducts() async {
    emit(state.copyWith(productsState: LoadingApiResult()));
    var result = await _loadProductsUseCase();
    emit(state.copyWith(productsState: result));
  }
}
