import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/data/repositories/auth/data_sources/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network/api/commerce_services.dart';
import 'package:route_e_commerce_v2/features/network/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network/model/response/token_response/token_response.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  final CommerceServices _apiServices;
  AuthRemoteDataSourceImpl(this._apiServices);
  @override
  Future<ApiResult<TokenResponse>> login(LoginRequest request) async {
    try{
      return SuccessApiResult(await _apiServices.login(request));
    }catch(e){
      ///todo: handle error
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<TokenResponse>> register(RegisterRequest request) async {
    try{
      return SuccessApiResult(await _apiServices.register(request));
    }catch(e){
    ///todo: handle error
    return ErrorApiResult(ServerError(e.toString()));
    }
  }
}