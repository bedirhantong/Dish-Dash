import 'package:dish_dash/core/model/service_model/order/order_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/order/components/FilterButtonForOrders.dart';
import '../../core/model/service_model/order/components/OrderCard.dart';
import '../../core/model/service_model/order/order_model.dart';

class PastOrdersPage extends StatefulWidget {
  const PastOrdersPage({Key? key}) : super(key: key);

  @override
  State<PastOrdersPage> createState() => _PastOrdersPageState();
}

class _PastOrdersPageState extends State<PastOrdersPage> {
  final OrderService orderService = OrderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar, body: getAllOrderProducts);
  }

  FutureBuilder<List<OrderModel>> get getAllOrderProducts {
    return FutureBuilder<List<OrderModel>>(
      future: orderService.fetchAllOrderProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No order products available.'),
          );
        } else {
          return buildOrderProductsList(snapshot.data!, context);
        }
      },
    );
  }

  Widget buildOrderProductsList(
      List<OrderModel> orderList, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        OrderModel order = orderList[index];
        return OrderCard(order: order);
      },
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
