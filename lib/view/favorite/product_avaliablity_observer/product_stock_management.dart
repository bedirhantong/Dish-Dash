import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/model/service_model/product/product_model.dart';
import '../../../core/model/service_model/user/user_model.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>(
  (ref) => UserViewModel(),
);

abstract class BaseSubject {
  void addObserver(BaseObserver observer);
  void removeObserver(BaseObserver observer);
  void notifyObservers(Product product);
}

class Subject extends BaseSubject {
  List<BaseObserver> observers = [];

  @override
  void addObserver(BaseObserver observer) {
    observers.add(observer);
  }

  @override
  void removeObserver(BaseObserver observer) {
    observers.remove(observer);
  }

  @override
  void notifyObservers(Product product) {
    for (var observer in observers) {
      observer.update(product);
    }
  }
}

abstract class BaseObserver {
  void update(Product product);
}

class ProductInStockObserver extends BaseObserver {
  final UserModel user = UserViewModel().currentUser;

  ProductInStockObserver(user);

  @override
  void update(Product product) {
    product.isInStock = true;
  }
}
