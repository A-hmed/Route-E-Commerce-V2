import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/features/cart/domain/model/cart.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cubit/cart_state.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/widgets/checkout_section.dart';

import '../widgets/cart_product_widget.dart';
import '../widgets/cart_screen_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ///Lazy initialization
  late CartCubit cartCubit = BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    cartCubit.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartScreenAppbar(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartApi.hasData) {
            return buildCartList(state.cartApi.myData);
          } else if (state.cartApi.hasError) {
            return Center(child: Text(state.cartApi.myErrorMessage, style: TextStyle(color: AppColors.darkBlue),));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  buildCartList(Cart cart) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              var cartEntries = cart.cartEntries.values.toList();
              return CartProductWidget(cartEntry: cartEntries[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: cart.cartEntries.length,
          ),
        ),
        CheckoutSection(totalCartPrice: cart.totalCartPrice.toDouble() ?? 0),
        const SizedBox(height: 24),
      ],
    );
  }
}
