import 'order_component.dart';
import 'order_decorator.dart';

class DrinkDecorator extends OrderDecorator {
  final String drink;

  DrinkDecorator(OrderComponent component, this.drink) : super(component);

  @override
  double getExtraCost() => 7.0;

  @override
  int getExtraDeliveryTime() => 0;

  @override
  String get description => '${component.description} with $drink';
}
