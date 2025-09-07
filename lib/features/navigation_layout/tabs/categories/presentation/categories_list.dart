import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_tab_cubit.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_tab_state.dart';

import 'category_item.dart';

class VerticalCategoriesList extends StatefulWidget {
  final List<Category> categories;

  const VerticalCategoriesList({super.key, required this.categories});

  @override
  State<VerticalCategoriesList> createState() => _VerticalCategoriesListState();
}

class _VerticalCategoriesListState extends State<VerticalCategoriesList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesTabState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(width: 2, color: AppColors.blue.withOpacity(0.3)),
                left: BorderSide(width: 2, color: AppColors.blue.withOpacity(0.3)),
                bottom: BorderSide(
                  width: 2,
                  color: AppColors.blue.withOpacity(0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            // the categories items list
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: ListView.builder(
                itemCount: widget.categories.length,
                itemBuilder:
                    (context, index) => CategoryItem(
                      index,
                      widget.categories[index].name ?? "",
                      state.selectedIndex == index,
                      onItemClick,
                    ),
              ),
            ),
          ),
        );
      }
    );
  }

  // callback function to change the selected index
  onItemClick(int index) {
   CategoriesCubit cubit =  BlocProvider.of(context);
   cubit.onCategoryClick(index);
  }
}
