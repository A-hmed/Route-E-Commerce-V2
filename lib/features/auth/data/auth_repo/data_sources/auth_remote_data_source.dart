import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/token_response/token_response.dart';

abstract class AuthRemoteDataSource{
  Future<ApiResult<TokenResponse>> login(LoginRequest loginRequest);
  Future<ApiResult<TokenResponse>> register(RegisterRequest registerRequest);
}