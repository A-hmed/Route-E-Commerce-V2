import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecases/load_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecases/load_products_use_case.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_cubit_state.dart';

@injectable
class HomeCubit extends Cubit<HomeCubitState> {
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final LoadProductsUseCase _loadProductsUseCase;

  HomeCubit(this._loadProductsUseCase, this._loadCategoriesUseCase)
    : super(HomeCubitState.initial());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesState: LoadingApiResult()));
    var result = await _loadCategoriesUseCase();
    emit(state.copyWith(categoriesState: result));
  }

  Future<void> loadProducts() async {
    emit(state.copyWith(productState: LoadingApiResult()));
    var result = await _loadProductsUseCase();
    emit(state.copyWith(productState: result));
  }
}
