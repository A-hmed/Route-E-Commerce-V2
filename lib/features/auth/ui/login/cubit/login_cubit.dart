import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/domain/usecases/login_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/ui/login/cubit/login_state.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(LoginState(loginApiState: LoadingApiResult()));
    var result = await _loginUseCase(
      LoginRequest(email: email, password: password),
    );
    emit(LoginState(loginApiState: result));
  }
}
