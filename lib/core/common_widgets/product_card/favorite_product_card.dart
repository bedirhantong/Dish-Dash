import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view/home/components/product_details_page.dart';
import '../../viewmodel/user_viewmodel.dart';
import 'components/abstract_ product_card.dart';
import 'main_screen_card.dart';

class FavoriteProductCard extends ProductCardWidget {
  const FavoriteProductCard(
      {super.key,
      required super.product,
      required super.value,
      required super.oldCost,
      required super.amountOfDiscount});

  @override
  ConsumerState<FavoriteProductCard> createState() =>
      _FavoriteProductCardState();
}

class _FavoriteProductCardState extends ConsumerState<FavoriteProductCard> {
  var screenWidth;
  var screenHeight;
  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: widget.product,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.25,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.35,
              child: Image.network(
                widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.visible,
                          textDirection: TextDirection.ltr,
                          softWrap: true,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    widget.product.brand,
                    style: TextStyle(
                        color: Colors.grey[600],
                        overflow: TextOverflow.ellipsis),
                  ),
                  createProductStar(),
                  Text(
                    '${widget.product.price} TL',
                    style: TextStyle(color: Colors.orange[800]),
                  ),
                  // stokta kalma durumu vs.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !widget.product.isInStock
                          ? Container(
                              width: screenWidth * 0.26,
                              height: screenHeight * 0.05,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              child: const Text(
                                "Stokta kalmamıştır",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : UserViewModel.isContainsProductInList(
                                  widget.product, userViewModel.cartProducts)
                              ? InkWell(
                                  onTap: () {
                                    ref
                                        .read(userViewModelProvider)
                                        .removeProductInCartList(
                                            widget.product);
                                  },
                                  child: Container(
                                    width: screenWidth * 0.26,
                                    height: screenHeight * 0.04,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.deepPurple, width: 2),
                                    ),
                                    child: const Text(
                                      "Sepetten Çıkar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    widget.product.category.name != "meal"
                                        ? ref
                                            .read(userViewModelProvider)
                                            .addProductInCartList(
                                                widget.product)
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                  product: widget.product),
                                            ),
                                          );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.26,
                                    height: screenHeight * 0.04,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.deepPurple, width: 2),
                                    ),
                                    child: const Text(
                                      "Sepete ekle",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                      const SizedBox(
                        width: 20,
                      ),
                      UserViewModel.isContainsProductInList(
                              widget.product, userViewModel.currentUser.favList)
                          ? InkWell(
                              onTap: () {
                                ref
                                    .read(userViewModelProvider)
                                    .removeProductInFavoriteList(
                                        widget.product);
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.deepPurple,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                ref
                                    .read(userViewModelProvider)
                                    .addProductInFavoriteList(widget.product);
                              },
                              child: const Icon(Icons.favorite_border_outlined),
                            )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  createProductStar() {
    List starList1 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList2 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList3 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList4 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList5 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
    ];

    if (widget.product.star == 0) {
      return const Padding(
        padding: EdgeInsets.only(left: 3.0, top: 3.0),
        child: Row(
          children: [
            Text(
              "(Yeni Ürün)",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      );
    }

    if (widget.product.star == 1) {
      return Row(
        children: [
          starList1[0],
          starList1[1],
          starList1[2],
          starList1[3],
          starList1[4],
        ],
      );
    }

    if (widget.product.star == 2) {
      return Row(
        children: [
          starList2[0],
          starList2[1],
          starList2[2],
          starList2[3],
          starList2[4],
        ],
      );
    }

    if (widget.product.star == 3) {
      return Row(
        children: [
          starList3[0],
          starList3[1],
          starList3[2],
          starList3[3],
          starList3[4],
        ],
      );
    }

    if (widget.product.star == 4) {
      return Row(
        children: [
          starList4[0],
          starList4[1],
          starList4[2],
          starList4[3],
          starList4[4],
        ],
      );
    } else {
      return Row(
        children: [
          starList5[0],
          starList5[1],
          starList5[2],
          starList5[3],
          starList5[4],
        ],
      );
    }
  }
}
