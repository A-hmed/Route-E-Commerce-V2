import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/widgets/home_appbar.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/category_products_args.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/cubit/category_product_cubit.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/cubit/category_products_states.dart';

class CategoryProducts extends StatefulWidget {
  final CategoryProductsArgs args;

  const CategoryProducts({super.key, required this.args});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  CategoryProductsCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.loadProducts(widget.args.categoryId, widget.args.subCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).settings.arguments as CategoryProductsArgs;
    return Scaffold(
      appBar: HomeAppbar(),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.productsApiState.hasData) {
            var list = state.productsApiState.myData;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: list.length,
                itemBuilder:
                    (context, index) => CustomProductCard(product: list[index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: .8
                ),
              ),
            );
          } else if (state.productsApiState.hasError) {
            return Text(state.productsApiState.myErrorMessage);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

///Widget -> Vm -> Usecase -> Repo -> Ds -> Retrofit
