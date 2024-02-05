import 'delivery.dart';

class CargoMarketDeliveryStrategy implements DeliveryStrategy {
  @override
  double calculateDeliveryCost(double currentPrice) {
    return currentPrice + (currentPrice * 0.012);
  }
}
