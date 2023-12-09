import 'package:flutter/material.dart';

import '../../core/model/product/product_model.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartProducts;

  const CartPage({Key? key, required this.cartProducts}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          Text('\$0.00'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            if (widget.cartProducts.isEmpty)
              Text(
                'Your cart is empty.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cartProducts.length,
                  itemBuilder: (context, index) {
                    final product = widget.cartProducts[index];
                    return CartItemCard(product: product);
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              child: Text('Sipariş ver'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('Sepeti temizle'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final Product product;

  const CartItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Image.network(
          product.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
            ),
            Text(
              '1',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
