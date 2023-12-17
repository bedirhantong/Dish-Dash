import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -14,
              right: -10,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Teslimat Bilgileri",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('Bedirhan Tong'),
                Text(
                    'Address: Akdeniz University, Computer Engineering Department'),
                Text('Email: bedirhantongdev@gmail.com'),
              ],
            ),
          ],
        ));
  }
}
