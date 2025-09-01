import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/network/model/response/products/product_dm.dart';

import '../common/meta_data/meta_data.dart';

part 'products_response.g.dart';

// Product response class
@JsonSerializable()
class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductDM>? data;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}