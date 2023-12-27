import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/service_model/order/order_model.dart';
import '../../../../utils/factory/product_card/components/product_card_factory.dart';
import '../../../view_models/viewmodel/user_viewmodel.dart';

class OrderCard extends ConsumerStatefulWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  ConsumerState<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends ConsumerState<OrderCard> {
  @override
  void initState() {
    super.initState();
    ref.read(userViewModelProvider).updateOrderMap(widget.order.orderProducts);
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

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
            title: Text('Order No: ${widget.order.orderNumber}'),
            subtitle: Text(
                'Date: ${widget.order.orderDate.day}/${widget.order.orderDate.month}/${widget.order.orderDate.year}'),
            trailing: Text('Status: ${widget.order.orderStatus}'),
          ),
          const Divider(),
          ExpansionTile(
            maintainState: true,
            initiallyExpanded: false,
            title: const Text("Show Order Content"),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userViewModel.orderMap.keys.length,
                itemBuilder: (context, index) {
                  var product = userViewModel.orderMap.keys.elementAt(index);
                  return ProductCardFactory.createProductCard(
                    cardType: "ordered",
                    product: product,
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Total price: ${widget.order.totalAmount.toStringAsFixed(2)} ₺'),
          ),
        ],
      ),
    );
  }
}
