import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

import '../../../core/model/product/product_model.dart';
import '../../cart_page/cart_page.dart';
import 'minimalist_searchbar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key,
      required this.context,
      required this.cartItemCount,
      required this.cardList,
      required this.tabController});
  final BuildContext context;
  final int cartItemCount;
  final List<Product> cardList;
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.deepPurple,
      elevation: 10,
      backgroundColor: Colors.deepPurple,
      title: const Row(
        children: [
          Icon(
            Icons.handshake,
            color: Colors.white,
          ),
          // Spacer(),
          SizedBox(
            width: 10,
          ),
          Text(
            'Welcome to order page!',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
      actions: [
        IconBadge(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 20,
          ),
          itemCount: cartItemCount,
          top: 0,
          badgeColor: Colors.green, // You can customize badge color
          itemColor: Colors.white, // You can customize item color
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartPage(
                cartProducts: cardList,
              );
            }));
          },
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight * 2), // Set your preferred height
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: MinimalistSearchBar(),
            ),
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              controller: tabController,
              indicatorColor: Colors.white,
              tabs: const <Widget>[
                Tab(
                  // icon: Icon(Icons.cloud_outlined),
                  child: Text(
                    "Yeni Ürünler",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  // icon: Icon(Icons.cloud_outlined),
                  child: Text(
                    "Giyim",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Teknolojik",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Eğitim",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Spor",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
