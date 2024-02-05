import 'order_component.dart';
import 'order_decorator.dart';

class SauceDecorator extends OrderDecorator {
  final String sauce;

  SauceDecorator(OrderComponent component, this.sauce) : super(component);

  @override
  double getExtraCost() => 3.5; // Adjust for different sauces

  @override
  int getExtraDeliveryTime() => 0;

  @override
  String get description => '${component.description} with $sauce';
}
