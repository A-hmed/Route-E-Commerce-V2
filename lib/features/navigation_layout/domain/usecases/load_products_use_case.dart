
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/repository/home_repository.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

@injectable
class LoadProductsUseCase {
  final HomeRepository _homeRepository;

  LoadProductsUseCase(this._homeRepository);

  Future<ApiResult<List<Product>>> call() => _homeRepository.getProducts();
}
