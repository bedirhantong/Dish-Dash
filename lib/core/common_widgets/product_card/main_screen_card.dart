import 'package:flutter/material.dart';
import '../../../view/home/components/product_details_page.dart';
import '../../viewmodel/user_viewmodel.dart';
import 'components/abstract_ product_card.dart';

class MainScreenCard extends ProductCardWidget {
  const MainScreenCard({
    super.key,
    required super.product,
    required super.isMainScreenCard,
    required super.isFavoriteCard,
    required super.isDetailedCard,
    required super.isCartCard,
    required super.isOrderedCard,
    required super.value,
    required super.oldCost,
    required super.amountOfDiscount,
  });

  @override
  State<MainScreenCard> createState() => _MainScreenCardState();
}

class _MainScreenCardState extends State<MainScreenCard> {
  var screenWidth;
  var screenHeight;

  int adet = 1;
  @override
  void initState() {
    super.initState();
    adet = UserViewModel.howManyItemIHaveInCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18.0,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "4.5",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  UserViewModel.isContainsProductInList(
                          widget.product, UserViewModel.cartProducts)
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              UserViewModel.removeProductInCartList(
                                  widget.product);
                            });
                          },
                          child: Container(
                            width: screenWidth * 0.28,
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              UserViewModel.addProductInCartList(
                                  widget.product);
                            });
                          },
                          child: Container(
                            width: screenWidth * 0.28,
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
