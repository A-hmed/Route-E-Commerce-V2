import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/sub_catgories_list.dart';

import '../../home/presentation/widgets/categories_list.dart';

class CategoriesTabView extends StatelessWidget {
  const CategoriesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 12),
      child: Row(
        children: [
          CategoriesList(categories: [],),
          SizedBox(
            width: 16,
          ),
          SubCategoriesList()
        ],
      ),
    );
  }
}