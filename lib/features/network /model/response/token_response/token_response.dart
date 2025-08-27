import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/user/user.dart';

part 'token_response.g.dart';

// Top-level response class
@JsonSerializable()
class TokenResponse {
  final String message;
  final User user;
  final String token;

  TokenResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
