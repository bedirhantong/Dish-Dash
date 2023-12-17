import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import '../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../../core/model/service_model/product/product_service.dart';

class FavoritePage extends StatefulWidget {
  final int cartItemCount;
  const FavoritePage({super.key, required this.cartItemCount});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController controller2;

  final ProductService productService = ProductService();

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getAllFavoriteProducts,
        ),
      ),
    );
  }

  FutureBuilder<List<Product>> get getAllFavoriteProducts {
    return FutureBuilder<List<Product>>(
      future: productService.fetchAllProducts(5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No products available.'),
          );
        } else {
          return buildFavProductsList(snapshot.data!, context);
        }
      },
    );
  }

  Widget buildFavProductsList(List<Product> productList, BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        Product product = productList[index];
        return ProductCardFactory.createProductCard(
            cardType: 'favorite',
            product: product,
            cartItemCount: widget.cartItemCount,
            cargoType: product.cargoType,
            onAddToCart: (int) {});
      },
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
