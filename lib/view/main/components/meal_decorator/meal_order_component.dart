import '../../../../core/model/service_model/product/product_model.dart';
import 'order_component.dart';

class MealOrder implements OrderComponent {
  final Product product;

  MealOrder(this.product);

  @override
  String get description => product.name;

  @override
  double get price => product.price;

  @override
  int get deliveryTime => 20; // Base delivery time
}
