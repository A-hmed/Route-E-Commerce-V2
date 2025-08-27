import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';

class LoginState {
  ApiResult loginApiState;

  LoginState({required this.loginApiState});
  LoginState.initial() : loginApiState = InitialApiResult();
}
