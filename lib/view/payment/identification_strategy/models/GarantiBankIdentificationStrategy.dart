import 'IdentificationStrategy.dart';

class GarantiBankIdentificationStrategy implements BankIdentificationStrategy {
  @override
  double updatePriceWithTax(double currentPrice) {
    currentPrice += currentPrice * 0.05678;
    return currentPrice;
  }
}
