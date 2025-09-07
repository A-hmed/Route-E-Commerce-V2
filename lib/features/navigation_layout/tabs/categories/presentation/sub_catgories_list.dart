import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/category_card_item.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/sub_category_item.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_products_args.dart';

class SubCategoriesList extends StatelessWidget {
  final Category selectedCategory;
  final List<Category> subCategories;

  const SubCategoriesList({
    super.key,
    required this.selectedCategory,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              selectedCategory.name ?? "",
              style: const TextStyle(color: AppColors.blue, fontSize: 14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem(
              selectedCategory.name ?? "",
              selectedCategory.image ?? "",
            ),
          ),
          // the grid view of the subcategories
          if (subCategories.isNotEmpty)
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: subCategories.length,
                (context, index) => SubCategoryItem(
                  subCategories[index].name ?? "",
                  AppImages.advertisement1,
                  () {
                    Navigator.pushNamed(
                      context,
                      Routes.categoryProducts,
                      arguments: CategoryProductsArgs(
                        selectedCategory.id ?? "",
                        subCategories[index].id ?? "",
                      ),
                    );
                  },
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: .7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            )
          else
            const SliverToBoxAdapter(
              child: Text(
                "No subcategories found",
                style: TextStyle(color: AppColors.darkBlue),
              ),
            ),
        ],
      ),
    );
  }
}
