import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';

@injectable
class RegisterUseCase {
  AuthRepo _repo;

  RegisterUseCase(this._repo);

  Future<ApiResult> call(RegisterRequest request) =>
      _repo.register(request);
}
