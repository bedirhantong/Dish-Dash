import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/order/components/FilterButtonForOrders.dart';
import '../../core/model/service_model/order/components/OrderCard.dart';
import '../../core/model/service_model/order/order_model.dart';

class PastOrdersPage extends ConsumerStatefulWidget {
  const PastOrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PastOrdersPage> createState() => _PastOrdersPageState();
}

class _PastOrdersPageState extends ConsumerState<PastOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: appbar,
      body: userViewModel.currentUser.orderList.isEmpty
          ? const Center(
              child: Text("There is no such order"),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: userViewModel.currentUser.orderList.length,
              itemBuilder: (context, index) {
                OrderModel order = userViewModel.currentUser.orderList[index];
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
