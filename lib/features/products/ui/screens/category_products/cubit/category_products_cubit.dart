import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/usecase/load_products_use_case.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/cubit/category_products_state.dart';

@injectable
class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final LoadProductsUseCase _loadProductsUseCase;

  CategoryProductsCubit(this._loadProductsUseCase)
    : super(CategoryProductsState.initial());

  Future<void> loadProducts(String categoryId, String subCategoryId) async {
    emit(state.copyWith(productsApiState: LoadingApiResult()));
    var result = await _loadProductsUseCase(
      categoryId: categoryId,
      subCategory: subCategoryId,
    );
    emit(state.copyWith(productsApiState: result));
  }
}
