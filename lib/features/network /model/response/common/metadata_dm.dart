class MetadataDM {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  MetadataDM({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  MetadataDM.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}
