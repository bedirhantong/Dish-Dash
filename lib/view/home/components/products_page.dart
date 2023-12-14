import 'package:flutter/material.dart';
import '../../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../../core/model/service_model/product_model/product_model.dart';

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
        return ProductCardFactory.createProductCard(
            cardType: 'mainScreen',
            product: widget.products[index],
            cartItemCount: widget.cartItemCount,
            cargoType: widget.products[index].cargoType,
            onAddToCart: (int) {});
      },
    );
  }
}
