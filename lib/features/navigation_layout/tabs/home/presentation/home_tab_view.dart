import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_cubit.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_cubit_state.dart';

import 'widgets/advertisements_list.dart';
import 'widgets/categories_list.dart';
import 'widgets/products_list.dart';
import 'widgets/section_title.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeCubit homeCubit = getIt();

  @override
  void initState() {
    super.initState();
    homeCubit.loadProducts();
    homeCubit.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const AdvertisementsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SectionTitle(title: locale.categories, viewAllVisibility: true),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: BlocBuilder<HomeCubit, HomeCubitState>(
            bloc: homeCubit,
            builder: (context, state) {
              if (state.categoriesState.hasData) {
                return CategoriesList(categories: state.categoriesState.myData);
              }else if(state.categoriesState.hasError){
                return Text(state.categoriesState.myErrorMessage);
              }else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SectionTitle(title: locale.homeAppliance),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: BlocBuilder<HomeCubit, HomeCubitState>(
            bloc: homeCubit,
            builder: (context, state) {
              if (state.productState.hasData) {
                return ProductsList(products: state.productState.myData);
              }else if(state.productState.hasError){
                return Text(state.productState.myErrorMessage);
              }else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
