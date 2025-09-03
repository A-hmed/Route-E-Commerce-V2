import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_cubit.dart';

import 'category_item.dart';
import 'cubit/categories_state.dart';

class CategoriesList extends StatefulWidget {
  final List<Category> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: 2,
                  color: AppColors.blue.withOpacity(0.3),
                ),
                left: BorderSide(
                  width: 2,
                  color: AppColors.blue.withOpacity(0.3),
                ),
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
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: ListView.builder(
                itemCount: widget.categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  widget.categories[index].name,
                  state.selectedCategoryIndex == index,
                  () {
                    var cubit = BlocProvider.of<CategoriesCubit>(context);
                    cubit.updateSelectedCategoryIndex(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
