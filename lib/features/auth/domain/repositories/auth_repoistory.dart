import 'package:route_e_commerce_v2/core/api_result/api_result.dart';
import 'package:route_e_commerce_v2/features/network/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/model/request/register_request/register_request.dart';

abstract class AuthRepository{
  Future<ApiResult<void>> login(LoginRequest request);
  Future<ApiResult<void>> register(RegisterRequest request);
}