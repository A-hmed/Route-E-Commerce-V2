import 'package:dio/dio.dart';
import 'package:route_e_commerce_v2/core/shared_prefs_helper/shared_prefs_helper.dart';

class AuthInterceptor extends Interceptor {
  SharedPrefsHelper sharedPrefsHelper;

  AuthInterceptor(this.sharedPrefsHelper);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["token"] = await sharedPrefsHelper.getToken();
    super.onRequest(options, handler);
  }
}
