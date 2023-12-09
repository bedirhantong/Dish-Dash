import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardBack extends StatelessWidget {
  final TextEditingController cvvController;

  const CardBack({Key? key, required this.cvvController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.black,
        margin: const EdgeInsets.all(4),
        child: Stack(
          children: [
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
                  controller: cvvController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'CVV',
                    hintText: 'XXX',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Çizgi rengi pasif durumda
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Çizgi rengi aktif durumda
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
}
