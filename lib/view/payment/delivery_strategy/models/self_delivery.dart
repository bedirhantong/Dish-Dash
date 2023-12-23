import 'delivery.dart';

class SelfDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateDeliveryCost(double currentPrice) {
    return currentPrice;
  }
}
