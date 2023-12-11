import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../../model/product/product_model.dart';
import '../../../../view/home/components/product_details_page.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget(
      {super.key,
      required this.isMainScreenCard,
      required this.isFavoriteCard,
      required this.isCartCard,
      required this.value,
      required this.oldCost,
      required this.amountOfDiscount,
      required this.product,
      required this.cartItemCount,
      required this.onAddToCart,
      required this.cardList,
      required this.cargoType,
      required this.isDetailedCard});
  final Product product;
  final int cartItemCount;
  final Function(int) onAddToCart;
  final List<Product> cardList;
  final bool isMainScreenCard;
  final bool isFavoriteCard;
  final bool isDetailedCard;
  final bool isCartCard;
  final int value;
  final String cargoType;
  final double oldCost;
  final String amountOfDiscount;
  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  var screenWidth;
  var screenHeight;
  @override
  Widget build(BuildContext context) {
    if (widget.isMainScreenCard) return crateMainScreenCard();

    if (widget.isFavoriteCard) return createFavoritesProductCard();

    if (widget.isCartCard) {
      return createCartProductCard();
    } else {
      return createDetailedProductCard();
    }
  }

  //sepette görünecek olan Card
  createCartProductCard() {
    int adet = 1;
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.brand,
                      style: const TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert_outlined),
                      onPressed: () {
                        showAlertDialog();
                      },
                    ),
                  ],
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                      color: Colors.grey[600], overflow: TextOverflow.ellipsis),
                ),
                createProductStar(),
                Text(
                  'Kargo ${widget.cargoType}',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  '${widget.product.price} TL',
                  style: TextStyle(color: Colors.orange[800]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          const AlertDialog();
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          showAlertDialog();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  // widget.cardList!.remove(widget.product);
                                  adet -= 1;
                                });
                              },
                            ),
                            Text(
                              '$adet',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  adet += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // favorilerde görünecek olan Card
  createFavoritesProductCard() {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.22,
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
          Container(
            width: screenWidth * 0.55,
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.brand,
                      style: const TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert_outlined),
                      onPressed: () {
                        showAlertDialog();
                      },
                    ),
                  ],
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                      color: Colors.grey[600], overflow: TextOverflow.ellipsis),
                ),
                createProductStar(),
                Text(
                  'Kargo ${widget.cargoType}',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  '${widget.product.price} TL',
                  style: TextStyle(color: Colors.orange[800]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      showAlertDialog();
                    },
                    child: Container(
                      width: 80,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: const Text(
                        "Stokta Kalmadı",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // clicked product
  createDetailedProductCard() {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.93,
                    height: screenHeight * 0.4,
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.fill,
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
                          Text(
                            widget.product.brand,
                            style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.fade,
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
                      ExpansionTile(
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
                  child: Container(
                    width: screenWidth * 0.33,
                    height: screenHeight * 0.04,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          "Seçiniz",
                        ),
                        value: widget.value,
                        items: [
                          if (!widget.product.ebat)
                            const DropdownMenuItem(
                              value: 1,
                              child: Text("Tek Ebat"),
                            ),
                          if (widget.product.ebat)
                            const DropdownMenuItem(
                              value: 1,
                              child: Text("S"),
                            ),
                          if (widget.product.ebat)
                            const DropdownMenuItem(
                              value: 2,
                              child: Text("M"),
                            ),
                          if (widget.product.ebat)
                            const DropdownMenuItem(
                              value: 3,
                              child: Text("L"),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            value = value;
                          });
                        }),
                  ),
                ),
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
              ],
            ),
          ),
        )
      ],
    );
  }

  // ana ekranda gözükecek olan Card
  crateMainScreenCard() {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: widget.product,
              cartItemCount: widget.cartItemCount,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container with gradient overlay for image
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: widget.product.isNew
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.red,
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        "4.5",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  !widget.cardList.contains(
                    widget.product,
                  )
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.green),
                            ),
                            Tooltip(
                              message: 'Sepete Ekle',
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.cardList.add(widget.product);
                                    widget
                                        .onAddToCart(widget.cartItemCount + 1);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Sepete eklendi'),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart_outlined),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  widget.cardList.remove(widget.product);
                                  widget.onAddToCart(widget.cartItemCount - 1);
                                });
                              },
                            ),
                            const Text(
                              '1',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  widget.cardList.add(widget.product);
                                  widget.onAddToCart(widget.cartItemCount + 1);
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  widget.cardList.remove(widget.product);
                                  widget.onAddToCart(widget.cartItemCount - 1);
                                });
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog() {
    return CoolAlert.show(
      context: context,
      title: "Ulağnnnnn",
      confirmBtnColor: Colors.orange,
      animType: CoolAlertAnimType.scale,
      type: CoolAlertType.error,
      text: "Henüz bu işlev eklenmedi.",
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
