import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/categories_list.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_tab_cubit.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_tab_state.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/sub_catgories_list.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  var categoriesCubit = getIt<CategoriesCubit>();

  @override
  void initState() {
    super.initState();
    categoriesCubit.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => categoriesCubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: BlocBuilder<CategoriesCubit, CategoriesTabState>(
          builder: (context, state) {
            if (state.categoriesApiState.hasData) {
              return buildCategoriesList(state.categoriesApiState.myData);
            } else if (state.categoriesApiState.hasError) {
              return const Text("No Categories Found");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Row buildCategoriesList(List<Category> categories) {
    return Row(
      children: [
        VerticalCategoriesList(categories: categories),
        const SizedBox(width: 16),
        BlocBuilder<CategoriesCubit, CategoriesTabState>(
          builder: (context, state) {
            if (state.subCategoriesApiState.hasData) {
              return SubCategoriesList(
                selectedCategory:
                    state.categoriesApiState.myData[state.selectedIndex],
                subCategories: state.subCategoriesApiState.myData,
              );
            } else if (state.subCategoriesApiState.hasError) {
              return Text(state.subCategoriesApiState.myErrorMessage);
            } else {
              return Expanded(child: const Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ],
    );
  }
}
