import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/network%20/model/response/category_response/category_dm.dart';

@injectable
class CategoryMapper{
  Category fromDataModel(CategoryDM category){
    return Category(
      id: category.id,
      name: category.name,
      image: category.image,
    );
  }
  List<Category> fromDataModels(List<CategoryDM> list)
     => list.map(fromDataModel).toList();
}