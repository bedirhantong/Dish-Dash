import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../identification_strategy/models/AkbankIdentificationStrategy.dart';
import '../identification_strategy/models/IdentificationStrategy.dart';
import '../identification_strategy/service/Context.dart';
import 'card_number_input_formatter.dart';

class CardFront extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final Function(String) onBankNameIdentified;

  const CardFront({
    super.key,
    required this.cardNumberController,
    required this.onBankNameIdentified,
    required this.expiryDateController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.black,
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 20, right: 160),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: cardNumberController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Card Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  CardNumberInputFormatter(
                    onBankNameIdentified: onBankNameIdentified,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: expiryDateController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Valid THRU',
                        hintText: 'MM/YY',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildCardLogo(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardLogo() {
    String cardNumber = cardNumberController.text;

    if (cardNumber.startsWith("4")) {
      // Visa
      return Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1024px-Visa_Inc._logo.svg.png",
        width: 30,
        height: 30,
      );
    } else if (cardNumber.startsWith("5")) {
      // MasterCard
      return Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png",
        width: 50,
        height: 50,
      );
    } else {
      return const Text(
        'Card Type Unknown',
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
