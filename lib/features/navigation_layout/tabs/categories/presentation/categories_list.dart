import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey,
            border: Border(
              // set the border for only 3 sides
                top: BorderSide(
                    width: 2,
                    color: AppColors.blue.withOpacity(0.3)),
                left: BorderSide(
                    width: 2,
                    color: AppColors.blue.withOpacity(0.3)),
                bottom: BorderSide(
                    width: 2,
                    color: AppColors.blue.withOpacity(0.3))),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),

          // the categories items list
          child: ClipRRect(
            // clip the corners of the container that hold the list view
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => CategoryItem(index,
                  "Laptops & Electronics", selectedIndex == index, onItemClick),
            ),
          ),
        ));
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}