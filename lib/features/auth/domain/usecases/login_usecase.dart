import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';

@injectable
class LoginUseCase {
  AuthRepo _repo;

  LoginUseCase(this._repo);

  Future<ApiResult> call(LoginRequest request) =>
      _repo.login(request);
}
