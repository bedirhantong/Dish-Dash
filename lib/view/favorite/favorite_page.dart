import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../../core/model/service_model/product/product_service.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

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
      body: UserViewModel.currentUser.favList.isEmpty
          ? const Center(
              child: Text("There is no any product in favorite"),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: UserViewModel.currentUser.favList.length,
                    itemBuilder: (context, index) {
                      Product product =
                          UserViewModel.currentUser.favList[index];
                      return ProductCardFactory.createProductCard(
                          cardType: 'favorite', product: product);
                    },
                  )),
            ),
    );
  }
}
