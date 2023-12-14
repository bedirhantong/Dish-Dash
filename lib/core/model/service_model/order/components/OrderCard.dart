import 'package:flutter/material.dart';
import '../../../../common_widgets/product_card/components/product_card_factory.dart';
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
                itemCount: order.orderProducts.length,
                itemBuilder: (context, index) {
                  final product = order.orderProducts[index];
                  return ProductCardFactory.createProductCard(
                      cardType: "ordered",
                      product: product,
                      cartItemCount: 2,
                      cargoType: product.cargoType,
                      onAddToCart: (int) {});
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Toplam Tutar: ${order.totalAmount.toStringAsFixed(2)} \₺'),
          ),
        ],
      ),
    );
  }
}
