import 'package:dish_dash/view/payment/components/card_front.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app/image_strings.dart';
import '../../../core/viewmodel/user_viewmodel.dart';

class CardBack extends ConsumerStatefulWidget {
  final TextEditingController cvvController;
  final TextEditingController cardNumberController;

  const CardBack(
      {Key? key,
      required this.cvvController,
      required this.cardNumberController})
      : super(key: key);

  @override
  ConsumerState<CardBack> createState() => _CardBackState();
}

class _CardBackState extends ConsumerState<CardBack> {
  late UserViewModel userViewModel;

  @override
  Widget build(BuildContext context) {
    userViewModel = ref.watch(userViewModelProvider);

    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.black38,
        margin: const EdgeInsets.all(4),
        child: Stack(
          children: [
            Positioned(
              right: 20,
              top: 20,
              child: _buildBankLogo(
                  userViewModel, widget.cardNumberController.text),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: SizedBox(
                width: 80,
                height: 60,
                child: Image.network(
                    "https://pnghq.com/wp-content/uploads/chip-png-see-through-background.png"),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: SizedBox(
                width: 100,
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  controller: widget.cvvController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'CVV',
                    hintText: 'XXX',
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
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build bank logo based on the identified bank
  Widget _buildBankLogo(UserViewModel userViewModel, String cardNumber) {
    String identifiedBank = "";
    if (cardNumber.startsWith("4")) {
      identifiedBank = 'Akbank';
      userViewModel.setBankIdentificationStrategy(
          BankIdentification.akbankIdentification);
    } else if (cardNumber.startsWith("5")) {
      identifiedBank = 'Garanti';
      userViewModel.setBankIdentificationStrategy(
          BankIdentification.garantiIdentification);
    } else {
      identifiedBank = 'Ziraat';
      userViewModel.setBankIdentificationStrategy(
          BankIdentification.ziraatIdentification);
    }

    switch (identifiedBank) {
      case 'Ziraat':
        return Image.asset(
          fit: BoxFit.contain,
          ImageStrings.ziraatLogo,
          width: 150,
          height: 50,
        );
      case 'Garanti':
        return Image.asset(
          ImageStrings.garantiLogo,
          width: 150,
          height: 50,
        );
      case 'Akbank':
        return Image.asset(
          ImageStrings.akbankLogo,
          width: 150,
          height: 50,
        );
      default:
        return const SizedBox();
    }
  }
}
