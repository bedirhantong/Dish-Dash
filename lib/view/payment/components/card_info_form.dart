import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'card_date_input_formatter.dart';
import 'card_number_input_formatter.dart';

class CardInformationForm extends StatelessWidget {
  const CardInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Kart Numarası',
                hintText: 'XXXX XXXX XXXX XXXX',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(onBankNameIdentified: (String) {}),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Son Kullanma Tarihi (AA/YY)',
                      hintText: 'MM/YY',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardDateInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        hintText: 'XXX',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
