import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/service_model/product/product_model.dart';

abstract class ProductCardWidget extends ConsumerStatefulWidget {
  final Product product;
  final int value;
  final double oldCost;
  final String amountOfDiscount;

  const ProductCardWidget({
    Key? key,
    required this.product,
    required this.value,
    required this.oldCost,
    required this.amountOfDiscount,
  }) : super(key: key);
}
