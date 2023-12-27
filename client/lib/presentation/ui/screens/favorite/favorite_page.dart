import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app/color_strings.dart';
import '../../../../data/service_model/product/product_model.dart';
import '../../../../utils/factory/product_card/components/product_card_factory.dart';
import '../../../view_models/viewmodel/user_viewmodel.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController controller2;
  @override
  void initState() {
    super.initState();
    controller2 = TabController(length: 2, vsync: this);
    Future.delayed(
      const Duration(seconds: 10),
      () {
        ref.read(userViewModelProvider).manageUserStock();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: userViewModel.currentUser.favList.isEmpty
          ? const Center(
              child: Text("There is no any product in favorite"),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: userViewModel.currentUser.favList.length,
                  itemBuilder: (context, index) {
                    Product product = userViewModel.currentUser.favList[index];
                    return ProductCardFactory.createProductCard(
                      cardType: 'detailed',
                      product: product,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
