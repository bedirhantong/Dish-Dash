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
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: screenWidth * 0.33,
              height: screenHeight * 0.04,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: const Text(
                "Sepeti temizle",
                style: TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentScreen(
                    cartProducts: [],
                    totalAmount: 2,
                  ),
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.33,
              height: screenHeight * 0.04,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple,
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: const Text(
                "Ödemeye geç",
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
