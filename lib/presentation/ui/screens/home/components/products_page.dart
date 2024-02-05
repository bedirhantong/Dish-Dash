import 'package:flutter/material.dart';
import '../../../../../data/service_model/product/product_model.dart';
import '../../../../../utils/factory/product_card/components/product_card_factory.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  const ProductsPage({
    Key? key,
    required this.products,
  }) : super(key: key);

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
        return ProductCardFactory.createProductCard(
          cardType: 'mainScreen',
          product: widget.products[index],
        );
      },
    );
  }
}
