import 'IdentificationStrategy.dart';

class ZiraatBankIdentificationStrategy implements IdentificationStrategy {
  @override
  double calculateTax(double amountOfPrice) {
    return amountOfPrice * 0.16;
  }
}
