import 'models/delivery.dart';

class OrderTypeSelection {
  late final DeliveryType _teslimatYontemi;

  OrderTypeSelection(DeliveryType teslimatYontemi) {
    _teslimatYontemi = teslimatYontemi;
  }

  void teslimatYap(String deliveryMessage) {
    _teslimatYontemi.selectDelivery(deliveryMessage);
  }
}
