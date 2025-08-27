import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/token_response/token_response.dart';
import 'package:retrofit/error_logger.dart';
part 'api_services.g.dart';

@injectable
@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

   @POST("/auth/signin")
   Future<TokenResponse> login(@Body() LoginRequest request);

  @POST("/auth/signup")
  Future<TokenResponse> register(@Body() RegisterRequest request);
}