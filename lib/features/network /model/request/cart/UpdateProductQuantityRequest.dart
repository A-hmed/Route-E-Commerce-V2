class UpdateProductQuantityRequest {
  UpdateProductQuantityRequest({
      this.count,});

  UpdateProductQuantityRequest.fromJson(dynamic json) {
    count = json['count'];
  }
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}