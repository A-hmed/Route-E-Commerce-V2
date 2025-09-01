import 'package:route_e_commerce_v2/features/network%20/model/response/common/metadata_dm.dart';

import 'category_dm.dart';

class CategoriesResponse {
  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataDM.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDM.fromJson(v));
      });
    }
  }
  num? results;
  MetadataDM? metadata;
  List<CategoryDM>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}