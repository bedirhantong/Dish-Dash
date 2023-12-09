import 'package:flutter/material.dart';

class BottomAppBarCartPage extends StatelessWidget {
  const BottomAppBarCartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            child: const Text('Sepeti temizle'),
            onPressed: () {},
          ),
          ElevatedButton(
            child: const Text('Ödemeye geç'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
