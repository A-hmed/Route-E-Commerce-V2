import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/utils/dialog_utils.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_state.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_tab_cubit.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/cubit/home_tab_state.dart';

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
  HomeTabCubit homeCubit = getIt();
  GlobalKey loadingDialogKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    homeCubit.loadCategories();
    homeCubit.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {},
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const AdvertisementsList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SectionTitle(title: locale.categories, viewAllVisibility: true),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          // const ,
          SliverToBoxAdapter(
            child: BlocBuilder<HomeTabCubit, HomeTabState>(
              bloc: homeCubit,
              builder: (context, state) {
                if (state.categoriesState.hasError) {
                  return Text(state.categoriesState.getError.message);
                } else if (state.categoriesState.hasData) {
                  return CategoriesList(
                    categories: state.categoriesState.getData,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          SectionTitle(title: locale.homeAppliance),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          // const ProductsList(),
          SliverToBoxAdapter(
            child: BlocBuilder<HomeTabCubit, HomeTabState>(
              bloc: homeCubit,
              builder: (context, state) {
                if (state.productsState.hasError) {
                  return Text(state.productsState.getError.message);
                } else if (state.productsState.hasData) {
                  return ProductsList(products: state.productsState.getData);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
