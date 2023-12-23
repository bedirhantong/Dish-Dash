import 'order_component.dart';

abstract class OrderDecorator implements OrderComponent {
  OrderComponent component;

  OrderDecorator(this.component);

  @override
  String get description => component.description;

  @override
  double get price => component.price + getExtraCost();

  @override
  int get deliveryTime => component.deliveryTime + getExtraDeliveryTime();

  double getExtraCost();
  int getExtraDeliveryTime();
}
