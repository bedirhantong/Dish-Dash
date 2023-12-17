import 'package:flutter/material.dart';
import '../../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../../core/model/service_model/product/product_model.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final double totalPrice;
  final int cartItemCount;
  const CartItemCard(
      {Key? key,
      required this.product,
      required this.totalPrice,
      required this.cartItemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ProductCardFactory.createProductCard(
            cardType: 'cartProduct',
            product: product,
            cartItemCount: cartItemCount,
            cargoType: product.cargoType,
            onAddToCart: (int) {}));
  }
}
