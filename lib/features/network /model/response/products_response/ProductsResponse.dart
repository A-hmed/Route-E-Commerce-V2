import 'package:route_e_commerce_v2/features/network%20/model/response/common/metadata_dm.dart';
import 'product_dm.dart';

class ProductsResponse {
  ProductsResponse({
      this.results, 
      this.metadataDM,
      this.data,});

  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadataDM = json['MetadataDM'] != null ? MetadataDM.fromJson(json['MetadataDM']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
  num? results;
  MetadataDM? metadataDM;
  List<ProductDM>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (MetadataDM != null) {
      map['MetadataDM'] = metadataDM?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}