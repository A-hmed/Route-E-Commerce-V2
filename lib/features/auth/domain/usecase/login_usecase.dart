import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repoistory.dart';
import 'package:route_e_commerce_v2/features/network/model/request/login_request/login_request.dart';

@injectable
class LoginUseCase{
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepository.login(request);
}