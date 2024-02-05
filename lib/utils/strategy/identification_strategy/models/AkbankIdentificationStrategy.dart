import 'IdentificationStrategy.dart';

class AkbankIdentificationStrategy implements BankIdentificationStrategy {
  @override
  double updatePriceWithTax(double currentPrice) {
    currentPrice += currentPrice * 0.09012;
    return currentPrice;
  }
}
