import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app/color_strings.dart';
import '../../../../core/constants/app/text_strings.dart';
import '../../../../data/service_model/product/product_model.dart';
import '../../../view_models/viewmodel/user_viewmodel.dart';
import '../cart_page/cart_page.dart';
import 'components/minimalist_searchbar.dart';
import 'components/products_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({required this.initIndex, super.key});

  final int initIndex;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 6, vsync: this, initialIndex: widget.initIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late UserViewModel userViewModel;
  @override
  Widget build(BuildContext context) {
    userViewModel = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: appBar(context),
      body: tabBarView,
    );
  }

  TabBarView get tabBarView {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        _buildTab(1, userViewModel.newProducts),
        _buildTab(2, userViewModel.clotheProducts),
        _buildTab(3, userViewModel.techProducts),
        _buildTab(4, userViewModel.eduProducts),
        _buildTab(5, userViewModel.sportProducts),
        _buildTab(6, userViewModel.mealProducts)
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
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
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
                Tab(
                  child: Text(
                    TextStrings.homeTabBar6,
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
