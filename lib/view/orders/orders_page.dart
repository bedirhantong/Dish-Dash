import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/order/components/FilterButtonForOrders.dart';
import '../../core/model/order/components/OrderCard.dart';
import '../../core/model/order/order_model.dart';
import '../../core/viewmodel/product_viewmodel/product_viewmodel.dart';

class PastOrdersPage extends StatefulWidget {
  const PastOrdersPage({Key? key}) : super(key: key);

  @override
  State<PastOrdersPage> createState() => _PastOrdersPageState();
}

class _PastOrdersPageState extends State<PastOrdersPage> {
  List<OrderModel> pastOrders = [
    OrderModel(
      orderNumber: 32141,
      orderDate: DateTime.now(),
      orderStatus: "On Delivery",
      products: ProductViewModel.clothingProductList,
      totalAmount: 5,
    ),
    OrderModel(
      orderNumber: 32141,
      orderDate: DateTime.now(),
      orderStatus: "Preparing to Cargo",
      products: ProductViewModel.educationProductList,
      totalAmount: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: pastOrders.isEmpty
          ? const Center(
              child: Text('Henüz geçmiş siparişiniz bulunmamaktadır.'),
            )
          : ListView.builder(
              itemCount: pastOrders.length,
              itemBuilder: (context, index) {
                final pastOrder = pastOrders[index];
                return OrderCard(order: pastOrder);
              },
            ),
    );
  }

  AppBar get appbar {
    return AppBar(
      backgroundColor: AppColor.appBarColor,
      title: const Text(
        'Siparişlerim',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            _showSearchDialog();
          },
        ),
        const FilterButtonForOrders(),
      ],
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sipariş Numarasına Göre Ara'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Sipariş numarasını girin',
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ara'),
            ),
          ],
        );
      },
    );
  }
}
