import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'card_back.dart';
import 'card_front.dart';

class CreditCardInputForm extends StatefulWidget {
  const CreditCardInputForm({super.key});

  @override
  _CreditCardInputFormState createState() => _CreditCardInputFormState();
}

class _CreditCardInputFormState extends State<CreditCardInputForm> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _bankName = '';

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: CardFront(
        cardNumberController: _cardNumberController,
        onBankNameIdentified: (bankName) {
          setState(() {
            _bankName = bankName;
          });
        },
        expiryDateController: _expiryDateController,
      ),
      back: CardBack(
        cvvController: _cvvController,
        cardNumberController: _cardNumberController,
      ),
    );
  }
}
