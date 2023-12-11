import 'package:flutter/material.dart';

import '../../core/model/product/product_model.dart';
import 'components/bottom_appbar.dart';
import 'components/products_in_cart.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartProducts;
  final int cartItemCount;

  const CartPage(
      {Key? key, required this.cartProducts, required this.cartItemCount})
      : super(key: key);

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
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: appBar,
      body: ProductsInCart(
        widget: widget,
        totalPrice: totalPrice,
        cartItemCount: widget.cartItemCount,
      ),
      // bottomSheet: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     height: screenHeight * 0.07,
      //     color: Colors.deepPurple.shade50,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Container(
      //             width: screenWidth * 0.33,
      //             height: screenHeight * 0.04,
      //             alignment: Alignment.center,
      //             margin: const EdgeInsets.all(1),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(5),
      //               color: Colors.white,
      //               border: Border.all(color: Colors.grey, width: 2),
      //             ),
      //             child: Text("fsafs"),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               width: screenWidth * 0.33,
      //               height: screenHeight * 0.04,
      //               alignment: Alignment.center,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(5),
      //                 color: Colors.deepPurple,
      //                 border: Border.all(color: Colors.deepPurple, width: 2),
      //               ),
      //               child: const Text(
      //                 "Sepete Ekle",
      //                 style: TextStyle(color: Colors.white, fontSize: 12),
      //                 textAlign: TextAlign.center,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomAppBarCartPage(
        cartProducts: widget.cartProducts,
      ),
    );
  }

  void clearCart() {
    setState(() {
      widget.cartProducts.clear();
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
