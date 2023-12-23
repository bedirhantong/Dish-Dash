import 'delivery.dart';

class CourierDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateDeliveryCost(double currentPrice) {
    return currentPrice + (currentPrice * 0.015);
  }
}
