import 'package:flutter/material.dart';

import '../../core/model/product/product_model.dart';
import 'components/bottom_appbar.dart';
import 'components/products_in_cart.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartProducts;

  const CartPage({Key? key, required this.cartProducts}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();

    for (var product in widget.cartProducts) {
      totalPrice += product.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ProductsInCart(widget: widget, totalPrice: totalPrice),
      bottomNavigationBar: const BottomAppBarCartPage(),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text(
        'Shopping Cart',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            '\$ $totalPrice',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
