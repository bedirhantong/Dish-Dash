import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:dish_dash/view/home/components/products_page.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

import '../../core/constants/app/color_strings.dart';
import '../../core/constants/app/text_strings.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../../core/model/service_model/product/product_service.dart';
import '../cart_page/cart_page.dart';
import 'components/minimalist_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
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
        _buildTab(1, UserViewModel.newProducts),
        _buildTab(2, UserViewModel.clotheProducts),
        _buildTab(3, UserViewModel.techProducts),
        _buildTab(4, UserViewModel.eduProducts),
        _buildTab(5, UserViewModel.sportProducts),
      ],
    );
  }

  Widget _buildTab(int categoryId, List<Product> listOfProducts) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ProductsPage(
        products: listOfProducts,
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
          itemCount: UserViewModel.sizeOfCart(),
          top: 0,
          badgeColor: Colors.red,
          itemColor: Colors.white,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartPage();
            }));
          },
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight * 2),
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
                  child: Text(
                    TextStrings.homeTabBar1,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
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
