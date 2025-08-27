import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/data/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network%20/api_services.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/token_response/token_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  Future<ApiResult<TokenResponse>> login(LoginRequest loginRequest) async {
    try {
      return SuccessApiResult(await _apiServices.login(loginRequest));
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }

  Future<ApiResult<TokenResponse>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      return SuccessApiResult(await _apiServices.register(registerRequest));
    } catch (e) {
      return ErrorApiResult(e.toString());
    }
  }
}
