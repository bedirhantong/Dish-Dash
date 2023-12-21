import '../models/IdentificationStrategy.dart';

class Context {
  late IdentificationStrategy _identificationStrategy;

  Context(IdentificationStrategy identificationStrategy) {
    _identificationStrategy = identificationStrategy;
  }

  double identifyBank(double amountOfPrice) {
    return _identificationStrategy.calculateTax(amountOfPrice);
  }
}
