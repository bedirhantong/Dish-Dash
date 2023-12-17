import 'IdentificationStrategy.dart';

class AkbankIdentificationStrategy implements IdentificationStrategy {
  @override
  Future<String> identifyBank() async {
    // Akbank'a özel algoritma
    var kartNumarasi = "1234-5678-9012-3456";

    // Kart numarasının ilk dört hanesini kontrol ediyoruz.
    if (kartNumarasi.substring(0, 4) == "1234") {
      return "Akbank";
    } else {
      return "";
    }
  }
}
