import 'IdentificationStrategy.dart';

class GarantiBankIdentificationStrategy implements IdentificationStrategy {
  @override
  double calculateTax(double amountOfPrice) {
    return amountOfPrice * 0.14;
  }
}
