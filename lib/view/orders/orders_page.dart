import 'dart:async';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/order/components/FilterButtonForOrders.dart';
import '../../core/model/service_model/order/components/OrderCard.dart';
import '../../core/model/service_model/order/order_model.dart';
import '../favorite/product_avaliablity_observer/notification_helper.dart';

class PastOrdersPage extends ConsumerStatefulWidget {
  const PastOrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PastOrdersPage> createState() => _PastOrdersPageState();
}

class _PastOrdersPageState extends ConsumerState<PastOrdersPage> {
  List<OrderModel> pastOrders = [];
  List<OrderModel> onProgressOrders = [];

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
    );
    super.initState();
  }

  Future<void> updateCurrentOrder() async {
    final userViewModel = ref.read(userViewModelProvider);

    for (var order in userViewModel.currentUser.orderList) {
      if (order.orderStatus != "Delivered") {
        // Simulate stock update with a random delay (between 1 and 10 seconds)
        final randomDelay = Random().nextInt(10) + 1;
        await Future.delayed(Duration(seconds: randomDelay));

        // Update stock status
        if (order.orderStatus == "Order Placed") {
          order.orderStatus = "Preparing";
          // Notify the user about the stock update
          sendNotification(order, userViewModel);
        } else if (order.orderStatus == "Preparing") {
          order.orderStatus = "Courier is on his way";
          // Notify the user about the stock update
          sendNotification(order, userViewModel);
        } else {
          order.orderStatus = "Delivered";
          // Notify the user about the stock update
          sendNotification(order, userViewModel);
        }
      }
    }
  }

  void sendNotification(OrderModel order, UserViewModel userViewModel) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "basic_channel",
        title: "Merhaba ${userViewModel.currentUser.name}",
        body:
            "${order.orderNumber} numaralı siparişinizin güncel sipariş durumunuz : ${order.orderStatus}",
      ),
    );
  }

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
