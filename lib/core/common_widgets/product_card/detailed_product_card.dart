import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../../model/service_model/product_model/product_model.dart';
import '../../model/service_model/product_model/product_service.dart';
import 'components/abstract_ product_card.dart';

class DetailedProductCard extends ProductCardWidget {
  const DetailedProductCard({
    super.key,
    required super.product,
    required super.cartItemCount,
    required super.onAddToCart,
    required super.cardList,
    required super.isMainScreenCard,
    required super.isFavoriteCard,
    required super.isDetailedCard,
    required super.isCartCard,
    required super.isOrderedCard,
    required super.value,
    required super.cargoType,
    required super.oldCost,
    required super.amountOfDiscount,
  });

  @override
  State<DetailedProductCard> createState() => _DetailedProductCardState();
}

class _DetailedProductCardState extends State<DetailedProductCard> {
  var screenWidth;
  var screenHeight;

  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 5,
                  bottom: screenHeight * 0.07,
                ),
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: screenWidth * 0.93,
                          height: screenHeight * 0.40,
                          child: Image.network(
                            widget.product.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.7,
                                  child: Text(
                                    widget.product.name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.fade,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.more_vert_outlined,
                                  ),
                                  onPressed: () {
                                    showAlertDialog();
                                  },
                                ),
                              ],
                            ),
                            createProductStar(),
                            Text(
                              'Kargo ${widget.cargoType}',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              '${widget.product.price} TL',
                              style: TextStyle(
                                color: Colors.orange[800],
                              ),
                            ),
                            ExpansionTile(
                              initiallyExpanded: true,
                              title: Text(
                                widget.product.description,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              children: [
                                Text(
                                  widget.product.description,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      overflow: TextOverflow.fade),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight * 0.07,
            color: Colors.deepPurple.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showAlertDialog();
                    },
                    child: Container(
                      width: screenWidth * 0.33,
                      height: screenHeight * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepPurple,
                        border: Border.all(color: Colors.deepPurple, width: 2),
                      ),
                      child: const Text(
                        "Sepete Ekle",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                getAllFavoriteProducts()
              ],
            ),
          ),
        )
      ],
    );
  }

  FutureBuilder<List<Product>> getAllFavoriteProducts() {
    return FutureBuilder<List<Product>>(
      future: productService.fetchAllProducts(5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          bool isProductInFavorites =
              isContainsProductInFavorites(widget.product, snapshot.data!);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: isProductInFavorites
                ? InkWell(
                    onTap: () async {
                      // Remove from favorites
                      // await productService.removeProductFromFavorites(widget.product.id)
                    },
                    child: Container(
                      width: screenWidth * 0.33,
                      height: screenHeight * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.deepPurple, width: 2),
                      ),
                      child: const Text(
                        "Favorilerden Çıkar",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() async {
                        await productService
                            .addProductToFavorites(widget.product.id);
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.33,
                      height: screenHeight * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.deepPurple, width: 2),
                      ),
                      child: const Text(
                        "Favorilere Ekle",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          );
        }
      },
    );
  }

  bool isContainsProductInFavorites(Product product, List<Product> favorites) {
    return favorites.any((pr) => pr.id == product.id);
  }

  showAlertDialog() {
    return CoolAlert.show(
      context: context,
      title: "Info",
      confirmBtnColor: Colors.orange,
      animType: CoolAlertAnimType.scale,
      type: CoolAlertType.info,
      text: "Buraya ne eklesem bilemedim",
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
