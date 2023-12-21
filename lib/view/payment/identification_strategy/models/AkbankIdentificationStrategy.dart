import 'IdentificationStrategy.dart';

class AkbankIdentificationStrategy implements IdentificationStrategy {
  @override
  double calculateTax(double amountOfPrice) {
    return amountOfPrice * 0.18;
  }
}
