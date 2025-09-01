import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/network/model/response/categories/category_dm.dart';

@injectable
class CategoryMapper {
  Category fromDataModel(CategoryDM category) {
    return Category(
      id: category.id ?? "",
      name: category.name ?? "",
      image: category.image ?? "",
    );
  }

  List<Category> fromDataModels(List<CategoryDM> categories) {
    return categories.map(fromDataModel).toList();
  }
}
