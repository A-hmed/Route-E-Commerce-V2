import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/cart/AddProductToCartRequest.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/login_request/login_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/request/register_request/register_request.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/cart/cart_response.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/category_response/categories_response.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/products_response/ProductsResponse.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/token_response/token_response.dart';
import 'package:retrofit/error_logger.dart';

import 'model/request/cart/UpdateProductQuantityRequest.dart';

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

  @GET("/products")
  Future<ProductsResponse> getProducts();

  @GET("/products?category={categoryId}&category={subCategoryId}")
  Future<ProductsResponse> getProductsOnCategory(
    @Path() String categoryId,
    @Path() String subCategoryId,
  );

  @GET("/categories")
  Future<CategoriesResponse> getCategories();

  @GET("/categories/{categoryId}/subcategories")
  Future<CategoriesResponse> getSubCategoriesOnCategory(
    @Path() String categoryId,
  );

  @GET("/v1/cart")
  Future<CartResponse> getCart();

  @POST("/v1/cart")
  Future<dynamic> addToCart(@Body() AddProductToCartRequest request);

  @DELETE("/cart/{productId}")
  Future<CartResponse> removeFromCart(@Path() String productId);

  @PUT("/cart/{productId}}")
  Future<CartResponse> updateQuantityInCart(
    @Path() String productId,
    @Body() UpdateProductQuantityRequest request,
  );
}
