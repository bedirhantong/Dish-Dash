import '../models/IdentificationStrategy.dart';

class Context {
  late IdentificationStrategy _identificationStrategy;

  Context(IdentificationStrategy identificationStrategy) {
    _identificationStrategy = identificationStrategy;
  }

  Future<String> identifyBank() async {
    return await _identificationStrategy.identifyBank();
  }
}
