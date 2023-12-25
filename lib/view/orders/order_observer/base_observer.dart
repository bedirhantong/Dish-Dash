import 'package:dish_dash/core/model/service_model/order/order_model.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';

import '../../../core/model/service_model/user/user_model.dart';

abstract class Observer {
  void update(OrderModel orderModel);
}

class UserOrderObserver extends Observer {
  final UserModel user = UserViewModel().currentUser;

  UserOrderObserver(user);

  @override
  void update(OrderModel orderModel) {
    // Update order status
    orderModel.orderStatus = "The courier is on his way";

    // Notify user or perform other actions
    // For simplicity, we'll print a message here
    print(
        "${user.name}, your order status has been updated: ${orderModel.orderStatus}");
  }
}

enum OrderMethod {
  orderPlaced,
  preparing,
  onCourier,
  delivered,
}
