import 'package:flutter/material.dart';

import '../../../core/constants/common_widgets/products/products_card_common.dart';
import '../../../core/model/product/product_model.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  final int cartItemCount;
  final Function(int) onAddToCart;
  final List<Product> cardList;
  const ProductsPage(
      {Key? key,
      required this.products,
      required this.cartItemCount,
      required this.onAddToCart,
      required this.cardList})
      : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: (screenHeight * 0.54) / 770,
      ),
      itemCount: widget.products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ProductCardWidget(
          isOrderedCard: false,
          isMainScreenCard: true,
          isFavoriteCard: false,
          isCartCard: false,
          value: 1,
          cargoType: "Bedava",
          oldCost: 2121,
          amountOfDiscount: '32',
          product: widget.products[index],
          cartItemCount: widget.cartItemCount,
          onAddToCart: widget.onAddToCart,
          cardList: widget.cardList,
          isDetailedCard: false,
        );
      },
    );
  }
}
