import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../view_models/viewmodel/user_viewmodel.dart';
import 'cart_item_card.dart';

class ProductsInCart extends ConsumerStatefulWidget {
  const ProductsInCart({super.key});

  @override
  ConsumerState<ProductsInCart> createState() => _ProductsInCartState();
}

class _ProductsInCartState extends ConsumerState<ProductsInCart> {
  @override
  void initState() {
    super.initState();
    ref.read(userViewModelProvider).updateCartMap();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (userViewModel.cartProducts.isEmpty)
            const Text(
              'Your cart is empty.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: userViewModel.cartMap.values.length,
                itemBuilder: (context, index) {
                  return CartItemCard(
                    product: userViewModel.cartMap.keys.elementAt(index),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
