import 'package:dish_dash/view/home/components/products_page.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

import '../../core/model/product/product_model.dart';
import '../../core/viewmodel/product_viewmodel/product_viewmodel.dart';
import '../cart_page/cart_page.dart';
import 'minimalist_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int cartItemCount = 0;
  List<Product> cardList = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onAddToCart(int newCartItemCount) {
    setState(() {
      cartItemCount = newCartItemCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
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
                controller: _tabController,
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
                      "Last Order",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Giyim",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kozmetik",
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductsPage(
                products: ProductViewModel.productList,
                cartItemCount: cartItemCount,
                onAddToCart: _onAddToCart,
                cardList: cardList),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's cloudy here"),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's rainy here"),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's gooo here"),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's sunny here"),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's freezing here"),
              ),
            ),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("It's loooo here"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
