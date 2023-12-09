import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  final Function(String) onBankNameIdentified;

  CardNumberInputFormatter({required this.onBankNameIdentified});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (text.length > oldValue.text.length) {
      if (text.length % 5 == 0) {
        final String lastChar = text.substring(text.length - 1);
        if (lastChar != ' ') {
          text = '${text.substring(0, text.length - 1)} $lastChar';

          // Identify the bank based on the first 4 digits of the card number
          if (text.length >= 4) {
            final String firstFourDigits = text.substring(0, 4);
            identifyBankName(firstFourDigits);
          }

          return TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }
      }
    }

    return newValue;
  }

  void identifyBankName(String firstFourDigits) {
    int firstFourDigitsValue = int.parse(firstFourDigits);

    if (firstFourDigitsValue >= 0 && firstFourDigitsValue <= 250) {
      onBankNameIdentified('X Bankası');
    } else if (firstFourDigitsValue > 250 && firstFourDigitsValue <= 500) {
      onBankNameIdentified('Y Bankası');
    } else if (firstFourDigitsValue > 500 && firstFourDigitsValue <= 750) {
      onBankNameIdentified('Z Bankası');
    } else if (firstFourDigitsValue > 750 && firstFourDigitsValue <= 1000) {
      onBankNameIdentified('A Bankası');
    } else {
      onBankNameIdentified('Bilinmeyen Banka');
    }
  }
}
