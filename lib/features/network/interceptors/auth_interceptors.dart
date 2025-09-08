import 'package:dio/dio.dart';
import 'package:route_e_commerce_v2/core/shared_pref_helper/shared_pref_helper.dart';

class AuthInterceptor extends Interceptor{
  SharedPrefHelper sharedPrefHelper;

  AuthInterceptor(this.sharedPrefHelper);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("before onRequest = ${await sharedPrefHelper.getToken()}");
    options.headers["token"] = await sharedPrefHelper.getToken();
    handler.next(options);
  }
}