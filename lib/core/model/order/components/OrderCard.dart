import 'package:flutter/material.dart';

import '../../../constants/common_widgets/products/products_card_common.dart';
import '../../product/product_model.dart';
import '../order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Sipariş No: ${order.orderNumber}'),
            subtitle: Text('Tarih: ${order.orderDate}'),
            trailing: Text('Durum: ${order.orderStatus}'),
          ),
          const Divider(),
          ExpansionTile(
            maintainState: true,
            initiallyExpanded: false,
            title: const Text("Sipariş içeriğini görüntüle"),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.products.length,
                itemBuilder: (context, index) {
                  final product = order.products[index];
                  return ProductCardWidget(
                    isOrderedCard: true,
                    isDetailedCard: false,
                    isMainScreenCard: false,
                    isFavoriteCard: false,
                    isCartCard: false,
                    value: 3,
                    cargoType: "Bedava",
                    oldCost: 2121,
                    amountOfDiscount: '32',
                    product: product,
                    cartItemCount: 2,
                    onAddToCart: (int) {},
                    cardList: const [],
                  );

                  // _buildOrderItem(product);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('Toplam Tutar: \$${order.totalAmount.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(Product product) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.network(
        product.imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: const Text('Adet: 3'),
    );
  }
}
