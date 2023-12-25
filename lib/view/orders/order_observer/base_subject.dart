import 'dart:collection';

import '../../../core/model/service_model/order/order_model.dart';
import 'base_observer.dart';

abstract class Subject {
  HashMap<Observer, OrderModel> observerPairs = HashMap();

  void addObserver(Observer observer, OrderModel orderModel);

  void removeObserver(Observer observer);

  void notifyObservers(OrderModel orderModel);
}

class DishDashOrderModSubject extends Subject {
  @override
  void addObserver(Observer observer, OrderModel orderModel) {
    observerPairs[observer] = orderModel;
  }

  @override
  void notifyObservers(OrderModel orderModel) {
    observerPairs.forEach((observer, _) {
      observer.update(orderModel);
    });
  }

  @override
  void removeObserver(Observer observer) {
    observerPairs.remove(observer);
  }
}
