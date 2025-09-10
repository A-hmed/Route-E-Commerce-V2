import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/widgets/product_quantity_controller.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/cart_cubit%20/cart_state.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: .3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        product.imageCover ??
                        'https://ecommerce.routemisr.com/Route-Academy-products/1678303324588-cover.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? 'Unknown Product',
                        style: textTheme.headlineSmall,
                        maxLines: 1,
                      ),
                      Text(
                        product.description ?? 'No description available',
                        style: textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${product.price ?? 0} ',
                            style: textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                'Review (${product.ratingsAverage?.toStringAsFixed(1) ?? 0})',
                                style: textTheme.headlineSmall,
                              ),
                              SvgPicture.asset(AppSvgs.ratingIcon),
                            ],
                          ),
                        ],
                      ),

                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              if (state.latestCart?.isProductInCart(product.id,) != true)
                                IconButton(
                                  onPressed: () {
                                    cartCubit.addProductToCart(product.id);
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor: colorScheme.primary,
                                    foregroundColor: colorScheme.onPrimary,
                                    visualDensity: VisualDensity.compact,
                                    shape: const CircleBorder(),
                                  ),
                                  icon: const Icon(Icons.add_rounded),
                                ),
                              const SizedBox(height: 8),
                              if (state.latestCart?.isProductInCart(product.id,) ==
                                  true)
                                ProductQuantityController(
                                  quantity: state.latestCart?.getProductQuantity(product.id) ?? 0,
                                  onChanged: (newQuantity) {
                                    cartCubit.updateQuantity(product.id, newQuantity);
                                  },
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                //TODO: Implement favorite toggle functionality
              },
              child: CircleAvatar(
                backgroundColor: colorScheme.onPrimary,
                child: SvgPicture.asset(
                  AppSvgs.inactiveFavoriteIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
