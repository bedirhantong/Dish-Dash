import 'package:flutter/material.dart';

import '../../../model/service_model/product/product_model.dart';

abstract class ProductCardWidget extends StatefulWidget {
  final Product product;
  final bool isMainScreenCard;
  final bool isFavoriteCard;
  final bool isDetailedCard;
  final bool isCartCard;
  final bool isOrderedCard;
  final int value;
  final double oldCost;
  final String amountOfDiscount;

  const ProductCardWidget({
    Key? key,
    required this.product,
    required this.isMainScreenCard,
    required this.isFavoriteCard,
    required this.isDetailedCard,
    required this.isCartCard,
    required this.isOrderedCard,
    required this.value,
    required this.oldCost,
    required this.amountOfDiscount,
  }) : super(key: key);
}
