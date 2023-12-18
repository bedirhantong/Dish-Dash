import 'package:dish_dash/core/model/service_model/order/order_service.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: UserViewModel.currentUser.orderList.isEmpty
          ? const Center(
              child: Text("There is no such order"),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: UserViewModel.currentUser.orderList.length,
              itemBuilder: (context, index) {
                OrderModel order = UserViewModel.currentUser.orderList[index];
                return OrderCard(order: order);
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
