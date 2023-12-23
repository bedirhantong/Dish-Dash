import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../../core/common_widgets/product_card/main_screen_card.dart';
import '../../../core/constants/app/color_strings.dart';
import '../../../core/model/service_model/product/product_model.dart';
import '../../../core/viewmodel/user_viewmodel.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late int value4 = 1;
  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple.shade50,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          UserViewModel.isContainsProductInList(
                  widget.product, userViewModel.currentUser.favList)
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(userViewModelProvider)
                          .removeProductInFavoriteList(widget.product);
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(userViewModelProvider)
                          .addProductInFavoriteList(widget.product);
                    },
                    child: const Icon(Icons.favorite_border_outlined),
                  ),
                )
        ],
      ),
      body: ProductCardFactory.createProductCard(
        cardType: 'detailed',
        product: widget.product,
      ),
    );
  }
}
