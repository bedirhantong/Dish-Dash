import 'package:flutter/material.dart';
import '../../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../../core/constants/app/color_strings.dart';
import '../../../core/model/product/product_model.dart';

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
      body: ProductCardFactory.createProductCard(
          cardType: 'detailed',
          product: widget.product,
          cartItemCount: widget.cartItemCount,
          cargoType: widget.product.cargoType,
          onAddToCart: (int) {}),
    );
  }
}
