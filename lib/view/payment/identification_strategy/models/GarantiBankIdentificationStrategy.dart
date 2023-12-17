import 'IdentificationStrategy.dart';

class GarantiBankIdentificationStrategy implements IdentificationStrategy {
  @override
  Future<String> identifyBank() async {
    // Garanti Bankasına özel algoritma
    var kartNumarasi = "1234-5678-9012-3456";
    var sifre = "1234";

    // Kart numarasının ilk altı hanesini kontrol ediyoruz.
    if (kartNumarasi.substring(0, 6) == "567890") {
      return "Garanti Bankası";
    } else {
      return "";
    }
  }
}
