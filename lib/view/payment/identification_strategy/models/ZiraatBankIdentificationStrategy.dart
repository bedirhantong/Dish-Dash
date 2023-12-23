import 'IdentificationStrategy.dart';

class ZiraatBankIdentificationStrategy implements BankIdentificationStrategy {
  @override
  double updatePriceWithTax(double currentPrice) {
    currentPrice += currentPrice * 0.0;
    return currentPrice;
  }
}
