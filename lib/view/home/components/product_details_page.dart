import 'package:flutter/material.dart';

import '../../../core/constants/app/color_strings.dart';
import '../../../core/model/product/product_model.dart';
import '../../../core/constants/common_widgets/products/products_card_common.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final int cartItemCount;
  const ProductDetailPage(
      {super.key, required this.product, required this.cartItemCount});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int value4 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ProductCardWidget(
        isOrderedCard: false,
        isDetailedCard: true,
        isMainScreenCard: false,
        isFavoriteCard: false,
        isCartCard: false,
        value: value4,
        cargoType: "Bedava",
        oldCost: 2121,
        amountOfDiscount: '32',
        product: widget.product,
        cartItemCount: widget.cartItemCount,
        onAddToCart: (int) {},
        cardList: [],
      ),
    );
  }
}
