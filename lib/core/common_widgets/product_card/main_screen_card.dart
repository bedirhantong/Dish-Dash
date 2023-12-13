import 'package:flutter/material.dart';
import '../../../view/home/components/product_details_page.dart';
import 'components/abstract_ product_card.dart';

class MainScreenCard extends ProductCardWidget {
  const MainScreenCard({
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
  State<MainScreenCard> createState() => _MainScreenCardState();
}

class _MainScreenCardState extends State<MainScreenCard> {
  var screenWidth;
  var screenHeight;
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
                                  setState(
                                    () {
                                      widget.cardList.add(widget.product);
                                      widget.onAddToCart(
                                          widget.cartItemCount + 1);
                                    },
                                  );
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
                                setState(
                                  () {
                                    widget.cardList.remove(widget.product);
                                    widget
                                        .onAddToCart(widget.cartItemCount - 1);
                                  },
                                );
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
}
