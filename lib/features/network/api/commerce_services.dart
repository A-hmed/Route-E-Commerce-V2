import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:route_e_commerce_v2/features/network/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/products_response.dart';
import 'package:route_e_commerce_v2/features/network/model/response/token_response/token_response.dart';

part 'commerce_services.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
@injectable
abstract class CommerceServices {
  @factoryMethod
  factory CommerceServices(Dio dio) = _CommerceServices;

  @POST('/auth/signin')
  Future<TokenResponse> login(@Body() LoginRequest request);

  @POST('/auth/signup')
  Future<TokenResponse> register(@Body() RegisterRequest request);

  @GET('/categories')
  Future<CategoriesResponse> loadCategories();

  @GET('/products')
  Future<ProductsResponse> loadProducts();

}
