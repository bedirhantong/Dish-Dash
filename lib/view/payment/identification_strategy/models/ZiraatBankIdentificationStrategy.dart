import 'IdentificationStrategy.dart';

class ZiraatBankIdentificationStrategy implements IdentificationStrategy {
  @override
  Future<String> identifyBank() async {
    // Ziraat Bankasına özel algoritma
    var kartNumarasi = "1234-5678-9012-3456";
    var sifre = "1234";

    // Kart numarasının ilk sekiz hanesini kontrol ediyoruz.
    if (kartNumarasi.substring(0, 8) == "34567890") {
      return "Ziraat Bankası";
    } else {
      return "";
    }
  }
}
