import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collection/collection.dart';
import 'package:dish_dash/data/service_model/order/order_model.dart';
import '../../../../../data/service_model/user/user_model.dart';

abstract class IOrderObserver {
  UserModel userModel = UserModel(
    notifyMe: [],
    name: "",
    email: "",
    password: "",
    shippingAddress: "",
    photoLink: "",
    orderList: [],
    favList: [],
  );
  void orderUpdate();
}

class UserOrderNotificationObserver extends IOrderObserver {
  UserOrderNotificationObserver(UserModel user) {
    userModel = user;
  }
  @override
  void orderUpdate() {
    for (var order in userModel.orderList) {
      if (order.orderStatus != "Delivered") {
        // Simulate order status update
        if (order.orderStatus == "Order Placed") {
          order.orderStatus = "Preparing";
          sendNotificationForOrderStatus(order);
        } else if (order.orderStatus == "Preparing") {
          order.orderStatus = "Courier is on his way";
          sendNotificationForOrderStatus(order);
        } else {
          order.orderStatus = "Delivered";
          sendNotificationForOrderStatus(order);
        }
      }
    }
  }

  void sendNotificationForOrderStatus(OrderModel order) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "basic_channel",
        title: "Merhaba ${userModel.name}",
        body:
            "${order.orderNumber} numaralı siparişinizin güncel sipariş durumunuz : ${order.orderStatus}",
      ),
    );
  }
}

abstract class ISubject {
  Map<IOrderObserver, List<OrderModel>> observerPairs = {};

  void register(IOrderObserver observer, List<OrderModel> orders);
  void unRegister(IOrderObserver observer, List<OrderModel> orders);
  void notifyAll();
}

class OrderStatusManager extends ISubject {
  @override
  void notifyAll() {
    for (var entry in observerPairs.entries) {
      var observer = entry.key;
      observer.orderUpdate();
    }
  }

  @override
  void register(IOrderObserver observer, List<OrderModel> orders) {
    var existingEntry = observerPairs.entries
        .firstWhereOrNull((entry) => entry.key == observer);

    if (existingEntry != null) {
      // Add the products to the observer's list
      existingEntry.value.addAll(orders);
    } else {
      // Create a new entry with the observer and the list of products
      observerPairs[observer] = List.from(orders);
    }
  }

  @override
  void unRegister(IOrderObserver observer, List<OrderModel> orders) {
    var existingEntry = observerPairs.entries
        .firstWhereOrNull((entry) => entry.key == observer);

    if (existingEntry != null) {
      // Remove the associated products from the observer's list
      existingEntry.value.removeWhere((order) => orders.contains(order));

      // If the list is empty, remove the observer altogether
      if (existingEntry.value.isEmpty) {
        observerPairs.remove(observer);
      }
    }
  }
}
