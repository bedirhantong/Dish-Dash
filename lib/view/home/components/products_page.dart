import 'package:flutter/material.dart';

import '../../../core/model/product/product_model.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  final int cartItemCount;
  final Function(int) onAddToCart;
  final List<Product> cardList;
  const ProductsPage(
      {Key? key,
      required this.products,
      required this.cartItemCount,
      required this.onAddToCart,
      required this.cardList})
      : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 0.70,
      ),
      itemCount: widget.products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ProductCard(
          product: widget.products[index],
          cartItemCount: widget.cartItemCount,
          onAddToCart: widget.onAddToCart,
          cardList: widget.cardList,
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;
  final int cartItemCount;
  final Function(int) onAddToCart;
  final List<Product> cardList;
  const ProductCard(
      {Key? key,
      required this.product,
      required this.cartItemCount,
      required this.onAddToCart,
      required this.cardList})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container with gradient overlay for image
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              image: DecorationImage(
                image: NetworkImage(widget.product.imageUrl),
                fit: BoxFit.fill,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
            child: Align(
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
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    Tooltip(
                      message: 'Sepete Ekle',
                      child: IconButton(
                        onPressed: () {
                          widget.cardList.add(
                            Product(
                                name: widget.product.name,
                                imageUrl: widget.product.imageUrl,
                                price: widget.product.price,
                                isNew: widget.product.isNew,
                                star: widget.product.star),
                          );
                          widget.onAddToCart(widget.cartItemCount + 1);
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
