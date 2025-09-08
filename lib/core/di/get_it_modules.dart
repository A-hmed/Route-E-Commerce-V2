import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_e_commerce_v2/core/shared_pref_helper/shared_pref_helper.dart';
import 'package:route_e_commerce_v2/features/network/interceptors/auth_interceptors.dart';

@module
abstract class GetItModule {
  Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(AuthInterceptor(SharedPrefHelper()));
    dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));

    return dio;
  }
}
