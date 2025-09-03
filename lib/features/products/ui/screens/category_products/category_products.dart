import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/widgets/home_appbar.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/cubit/category_products_cubit.dart';
import 'package:route_e_commerce_v2/features/products/ui/screens/category_products/cubit/category_products_state.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryId;
  final String subCategoryId;

  const CategoryProducts({
    super.key,
    required this.categoryId,
    required this.subCategoryId,
  });

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  var cubit = getIt<CategoryProductsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.loadProducts(widget.categoryId, widget.subCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.productsApiState.hasData) {
            return buildProductsGrid(state.productsApiState.getData);
          } else if (state.productsApiState.hasError) {
            return Text("${state.productsApiState.getError.message}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildProductsGrid(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return CustomProductCard(product: products[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .8,
            crossAxisCount: 2,
             mainAxisSpacing: 12,
        crossAxisSpacing: 12),
      ),
    );
  }
}
