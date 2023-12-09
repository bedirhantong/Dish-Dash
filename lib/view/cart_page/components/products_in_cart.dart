import 'package:flutter/material.dart';

import '../cart_page.dart';
import 'cat_item_card.dart';

class ProductsInCart extends StatelessWidget {
  const ProductsInCart({
    super.key,
    required this.widget,
    required this.totalPrice,
  });

  final CartPage widget;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
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
          if (widget.cartProducts.isEmpty)
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
                itemCount: widget.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.cartProducts[index];
                  return CartItemCard(
                    product: product,
                    totalPrice: totalPrice,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
