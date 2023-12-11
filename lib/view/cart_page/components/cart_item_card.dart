import 'package:flutter/material.dart';

import '../../../core/constants/common_widgets/products/products_card_common.dart';
import '../../../core/model/product/product_model.dart';

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
        child: ProductCardWidget(
          isMainScreenCard: false,
          isFavoriteCard: false,
          isCartCard: true,
          value: product.value,
          cargoType: product.cargoType,
          oldCost: 2121,
          amountOfDiscount: '32',
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: (int) {},
          cardList: const [],
          isDetailedCard: false,
        ));
  }
}
