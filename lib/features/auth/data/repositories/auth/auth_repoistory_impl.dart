import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/data/repositories/auth/data_sources/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repoistory.dart';
import 'package:route_e_commerce_v2/features/network/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network/model/response/token_response/token_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
   ApiResult<TokenResponse> apiResult = await _remoteDataSource.login(request);
   if(apiResult is SuccessApiResult){
     //todo save token response in shared pref;
     return SuccessApiResult(null);
   }else{
     return apiResult;
   }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    ApiResult<TokenResponse> apiResult = await _remoteDataSource.register(request);
    if(apiResult is SuccessApiResult){
      //todo save token response in shared pref;
      return SuccessApiResult(null);
    }else{
      return apiResult;
    }
  }
}