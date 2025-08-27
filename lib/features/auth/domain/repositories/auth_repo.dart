import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';

abstract class AuthRepo{
  Future<ApiResult<void>> login(LoginRequest request);
  Future<ApiResult<void>> register(RegisterRequest request);
}