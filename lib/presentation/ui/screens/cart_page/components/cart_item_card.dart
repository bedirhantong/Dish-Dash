import 'package:flutter/material.dart';
import '../../../../../data/service_model/product/product_model.dart';
import '../../../../../utils/factory/product_card/components/product_card_factory.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  const CartItemCard({Key? key, required this.product}) : super(key: key);

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
          cardType: 'cartProduct', product: product),
    );
  }
}
