import 'package:flutter/material.dart';

import '../../../core/constants/app/color_strings.dart';

class ManagePaymentMethodsScreen extends StatelessWidget {
  const ManagePaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          'Manage Payment Methods',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('**** **** **** 1234'),
              subtitle: const Text('MasterCard'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                // Add logic to delete payment method
              },
            ),
            // Add more saved payment methods if needed
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to add a new payment method
              },
              child: const Text('Add Payment Method'),
            ),
          ],
        ),
      ),
    );
  }
}
