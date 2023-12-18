import 'package:flutter/material.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../../core/viewmodel/user_viewmodel.dart';
import 'components/bottom_appbar.dart';
import 'components/products_in_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  @override
  void initState() {
    super.initState();

    for (var product in UserViewModel.cartProducts) {
      totalPrice += product.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const ProductsInCart(),
      bottomNavigationBar: const BottomAppBarCartPage(),
    );
  }

  void clearCart() {
    setState(() {
      UserViewModel.cartProducts.clear();
    });
  }

  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.deepPurple,
      title: const Text(
        'Shopping Cart',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        const Icon(Icons.shopping_cart, color: Colors.white),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10.0),
          child: Text(
            '\$${totalPrice.toStringAsFixed(2)}',
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
