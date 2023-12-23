import 'order_component.dart';
import 'order_decorator.dart';

class AdditionalNoteDecorator extends OrderDecorator {
  final String note;

  AdditionalNoteDecorator(OrderComponent component, this.note)
      : super(component);

  @override
  double getExtraCost() => 0.0;

  @override
  int getExtraDeliveryTime() => 5; // Extra time for note processing

  @override
  String get description => '${component.description} ($note)';
}
