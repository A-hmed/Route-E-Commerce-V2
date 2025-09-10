import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_e_commerce_v2/core/network_utilis/auth_interceptor.dart';
import 'package:route_e_commerce_v2/core/shared_prefs_helper/shared_prefs_helper.dart';

@module
abstract class GetItModules{

  Dio getDio(){
    var dio = Dio();
    dio.interceptors.add(AuthInterceptor(SharedPrefsHelper()));
    dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
    return dio;
  }
}