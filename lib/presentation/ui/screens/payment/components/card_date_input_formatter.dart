import 'package:flutter/services.dart';


class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (text.isNotEmpty && text.length == 2) {
      final String lastChar = text.substring(text.length - 1);
      if (lastChar != '/') {
        text = '${text.substring(0, text.length - 1)}/$lastChar';
        return TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }
    }

    return newValue;
  }
}
