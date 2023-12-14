import 'package:dish_dash/view/home/components/products_page.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

import '../../core/constants/app/color_strings.dart';
import '../../core/constants/app/text_strings.dart';
import '../../core/model/service_model/product_model/product_model.dart';
import '../../core/model/service_model/product_model/product_service.dart';
import '../cart_page/cart_page.dart';
import 'components/minimalist_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int cartItemCount = 0;
  List<Product> cardList = [];
  final ProductService productService = ProductService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
      appBar: appBar(context),
      body: tabBarView,
    );
  }

  TabBarView get tabBarView {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        _buildTab(1, productService.fetchAllProducts(0)),
        _buildTab(2, productService.fetchAllProducts(2)),
        _buildTab(3, productService.fetchAllProducts(1)),
        _buildTab(4, productService.fetchAllProducts(3)),
        _buildTab(5, productService.fetchAllProducts(4)),
      ],
    );
  }

  Widget _buildTab(int categoryId, Future<List<Product>> fetchFunction) {
    return RefreshIndicator(
      strokeWidth: 2,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      displacement: 20,
      edgeOffset: 20,
      onRefresh: () async {
        setState(() {
          fetchFunction;
        });
      },
      child: FutureBuilder<List<Product>>(
        future: fetchFunction,
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
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ProductsPage(
                products: snapshot.data!,
                cartItemCount: cartItemCount,
                onAddToCart: _onAddToCart,
                cardList: cardList,
              ),
            );
          }
        },
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      shadowColor: AppColor.appBarColor,
      elevation: 10,
      backgroundColor: AppColor.appBarColor,
      title: Row(
        children: [
          const Icon(
            Icons.handshake,
            color: Colors.white,
          ),
          // Spacer(),
          const SizedBox(
            width: 10,
          ),
          Text(
            TextStrings.homeAppBarTitle,
            style: const TextStyle(color: Colors.white, fontSize: 15),
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
          badgeColor: Colors.red, // You can customize badge color
          itemColor: Colors.white, // You can customize item color
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartPage(
                cartProducts: cardList,
                cartItemCount: cartItemCount,
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
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  // icon: Icon(Icons.cloud_outlined),
                  child: Text(
                    TextStrings.homeTabBar1,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  // icon: Icon(Icons.cloud_outlined),
                  child: Text(
                    TextStrings.homeTabBar2,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    TextStrings.homeTabBar3,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    TextStrings.homeTabBar4,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    TextStrings.homeTabBar5,
                    style: const TextStyle(color: Colors.white),
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
