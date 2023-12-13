import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import '../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/viewmodel/product_viewmodel/product_viewmodel.dart';

class FavoritePage extends StatefulWidget {
  final int cartItemCount;
  const FavoritePage({super.key, required this.cartItemCount});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController controller2;
  late int value1 = 1;
  late int value2 = 1;
  late int value3 = 1;
  late int value4 = 1;
  late int value5 = 1;

  @override
  void initState() {
    super.initState();
    controller2 = TabController(length: 2, vsync: this);
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
            ProductCardFactory.createProductCard(
                cardType: 'favorite',
                product: ProductViewModel.educationProductList[2],
                cartItemCount: widget.cartItemCount,
                cargoType: ProductViewModel.educationProductList[2].cargoType,
                onAddToCart: (int) {}),
            ProductCardFactory.createProductCard(
                cardType: 'favorite',
                product: ProductViewModel.clothingProductList[2],
                cartItemCount: widget.cartItemCount,
                cargoType: ProductViewModel.educationProductList[2].cargoType,
                onAddToCart: (int) {}),
            ProductCardFactory.createProductCard(
                cardType: 'favorite',
                product: ProductViewModel.techProductList[1],
                cartItemCount: widget.cartItemCount,
                cargoType: ProductViewModel.techProductList[1].cargoType,
                onAddToCart: (int) {}),
            ProductCardFactory.createProductCard(
                cardType: 'favorite',
                product: ProductViewModel.clothingProductList[3],
                cartItemCount: widget.cartItemCount,
                cargoType: ProductViewModel.clothingProductList[3].cargoType,
                onAddToCart: (int) {}),
          ],
        ),
      ),
    );
  }

  showAlertDialog() {
    return CoolAlert.show(
      context: context,
      title: "INFO",
      confirmBtnColor: Colors.orange,
      animType: CoolAlertAnimType.scale,
      type: CoolAlertType.info,
      text: "Buraya ne koyacağımı bilemedim.",
    );
  }
}
