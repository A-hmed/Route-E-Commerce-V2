import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/domain/model/category.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_cubit.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/cubit/categories_state.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/sub_catgories_list.dart';

import 'categories_list.dart';


class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  CategoriesCubit cubit = getIt<CategoriesCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.loadCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state){
            if(state.categoriesApiState.hasData){
              return categoriesList(state.categoriesApiState.getData);
            }else if(state.categoriesApiState.hasError){
              return Text(state.categoriesApiState.getError.message);
            }else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }

  Padding categoriesList(List<Category> categories) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 12),
      child: Row(
        children: [
          CategoriesList(categories: categories,),
          SizedBox(
            width: 16,
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if(state.subCategoriesApiState.hasData){
                return SubCategoriesList(subCategories: state.subCategoriesApiState.getData,
                 selectedCategory: state.categoriesApiState.getData[state.selectedCategoryIndex],);
              }else if(state.subCategoriesApiState.hasError){
                return Text(state.subCategoriesApiState.getError.message);
              }else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
          )
        ],
      ),
    );
  }
}