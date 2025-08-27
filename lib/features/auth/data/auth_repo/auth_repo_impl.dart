import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/data/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/data/auth_repo/data_sources/auth_remote_data_source_impl.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/token_response/token_response.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRemoteDataSource _remoteDataSourceImpl;

  AuthRepoImpl(this._remoteDataSourceImpl);

  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
    ApiResult<TokenResponse> result = await _remoteDataSourceImpl.login(
      request,
    );
    if (result is SuccessApiResult) {
      //todo save token response in shared prefs.
      return SuccessApiResult(null);
    } else {
      return result;
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    ApiResult<TokenResponse> result = await _remoteDataSourceImpl.register(
      request,
    );
    if (result is SuccessApiResult) {
      //todo save token response in shared prefs.
      return SuccessApiResult(null);
    } else {
      return result;
    }
  }
}
