
import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/category_card_item.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: TextStyle(
                  color: AppColors.blue, fontSize: 14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem("Laptops & Electronics",
                AppImages.advertisement1, goToCategoryProductsListScreen),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 26,
                    (context, index) => SubCategoryItem(
                    'Watches',
                    "",
                    goToCategoryProductsListScreen),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ))
        ],
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}