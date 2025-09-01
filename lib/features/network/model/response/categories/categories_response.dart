import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/category_dm.dart';
import '../common/meta_data/meta_data.dart';

part 'categories_response.g.dart';

// Main response class
@JsonSerializable()
class CategoriesResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryDM> data;

  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}