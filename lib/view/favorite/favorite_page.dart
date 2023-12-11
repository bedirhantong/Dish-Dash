import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

import '../../core/constants/app/color_strings.dart';
import '../../core/constants/common_widgets/products/products_card_common.dart';
import '../../core/viewmodel/product_viewmodel/product_viewmodel.dart';

class FavoritePage extends StatefulWidget {
  final int cartItemCount;
  const FavoritePage({super.key, required this.cartItemCount});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController kontrolcu2;
  late int value1 = 1;
  late int value2 = 1;
  late int value3 = 1;
  late int value4 = 1;
  late int value5 = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kontrolcu2 = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        elevation: 1,
        title: const Text(
          "Favorilerim",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ProductCardWidget(
              isDetailedCard: false,
              isMainScreenCard: false,
              isFavoriteCard: true,
              isCartCard: false,
              value: value1,
              cargoType: "Bedava",
              oldCost: 2121,
              amountOfDiscount: '32',
              product: ProductViewModel.educationProductList[2],
              cartItemCount: widget.cartItemCount,
              onAddToCart: (int) {},
              cardList: const [],
            ),
            ProductCardWidget(
                isDetailedCard: false,
                isMainScreenCard: false,
                isFavoriteCard: true,
                isCartCard: false,
                value: value2,
                cargoType: "10.99",
                oldCost: 2323,
                amountOfDiscount: '32',
                product: ProductViewModel.clothingProductList[2],
                cartItemCount: widget.cartItemCount,
                onAddToCart: (int) {},
                cardList: const []),
            ProductCardWidget(
                isDetailedCard: false,
                isMainScreenCard: false,
                isFavoriteCard: true,
                isCartCard: false,
                value: value3,
                cargoType: "Bedava",
                oldCost: 2121,
                amountOfDiscount: '32',
                product: ProductViewModel.techProductList[1],
                cartItemCount: widget.cartItemCount,
                onAddToCart: (int) {},
                cardList: const []),
            ProductCardWidget(
                isDetailedCard: false,
                isMainScreenCard: false,
                isFavoriteCard: true,
                isCartCard: false,
                value: value4,
                cargoType: "Bedava",
                oldCost: 2121,
                amountOfDiscount: '32',
                product: ProductViewModel.clothingProductList[3],
                cartItemCount: widget.cartItemCount,
                onAddToCart: (int) {},
                cardList: const []),
          ],
        ),
      ),
    );
  }

  showAlertDialog() {
    return CoolAlert.show(
      context: context,
      title: "Hoop Hemşerim",
      confirmBtnColor: Colors.orange,
      animType: CoolAlertAnimType.scale,
      type: CoolAlertType.info,
      text: "Bu basit bir front-end uygulamasıdır.",
    );
  }
}
