import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../../core/viewmodel/user_viewmodel.dart';
import 'components/bottom_appbar.dart';
import 'components/products_in_cart.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  late UserViewModel userViewModel;
  @override
  Widget build(BuildContext context) {
    userViewModel = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: appBar,
      body: const ProductsInCart(),
      bottomNavigationBar: const BottomAppBarCartPage(),
    );
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
            '\$${userViewModel.getPriceOfCart().toStringAsFixed(2)}',
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
