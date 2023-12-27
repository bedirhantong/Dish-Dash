import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collection/collection.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/model/service_model/product/product_model.dart';
import '../../../core/model/service_model/user/user_model.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>(
  (ref) => UserViewModel(),
);

abstract class IObserver {
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
  void stockUpdate();
}

class UserNotificationObserver extends IObserver {
  UserNotificationObserver(UserModel user) {
    userModel = user;
  }
  @override
  void stockUpdate() {
    for (var product in userModel.favList) {
      if (!product.isInStock) {
        product.isInStock = true;
        sendNotificationForFavoriteProductStatus(product);
      }
    }
  }

  void sendNotificationForFavoriteProductStatus(Product product) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "basic_channel",
        title: "Merhaba ${userModel.name}",
        body:
            "${product.name} stoklarımıza girmiştir. Stoklar tükenmeden siparişini ver.",
      ),
    );
  }
}

abstract class ISubject {
  Map<IObserver, List<Product>> observerPairs = {};

  void register(IObserver observer, List<Product> products);
  void unRegister(IObserver observer, List<Product> products);
  void notifyAll();
}

class ProductStockManager extends ISubject {
  @override
  void notifyAll() {
    for (var entry in observerPairs.entries) {
      var observer = entry.key;
      observer.stockUpdate();
    }
  }

  @override
  void register(IObserver observer, List<Product> products) {
    var existingEntry = observerPairs.entries
        .firstWhereOrNull((entry) => entry.key == observer);

    if (existingEntry != null) {
      // Add the products to the observer's list
      existingEntry.value.addAll(products);
    } else {
      // Create a new entry with the observer and the list of products
      observerPairs[observer] = List.from(products);
    }
  }

  @override
  void unRegister(IObserver observer, List<Product> products) {
    var existingEntry = observerPairs.entries
        .firstWhereOrNull((entry) => entry.key == observer);

    if (existingEntry != null) {
      // Remove the associated products from the observer's list
      existingEntry.value.removeWhere((product) => products.contains(product));

      // If the list is empty, remove the observer altogether
      if (existingEntry.value.isEmpty) {
        observerPairs.remove(observer);
      }
    }
  }
}
