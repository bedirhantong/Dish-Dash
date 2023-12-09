import 'package:flutter/material.dart';

import '../../../core/model/product/product_model.dart';
import '../../payment/payment_screen.dart';

class BottomAppBarCartPage extends StatefulWidget {
  final List<Product> cartProducts;
  const BottomAppBarCartPage({
    super.key,
    required this.cartProducts,
  });

  @override
  State<BottomAppBarCartPage> createState() => _BottomAppBarCartPageState();
}

class _BottomAppBarCartPageState extends State<BottomAppBarCartPage> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            child: const Text('Sepeti temizle'),
            onPressed: () {
              setState(() {});
            },
          ),
          ElevatedButton(
            child: const Text('Ödemeye geç'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentScreen(
                          cartProducts: [],
                          totalAmount: 2,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
