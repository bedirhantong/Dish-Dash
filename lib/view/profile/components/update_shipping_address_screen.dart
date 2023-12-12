import 'package:flutter/material.dart';

import '../../../core/constants/app/color_strings.dart';

class UpdateShippingAddressScreen extends StatelessWidget {
  const UpdateShippingAddressScreen({Key? key}) : super(key: key);

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
          'Update Shipping Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Shipping Address',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),
            _buildInputField('Full Name'),
            const SizedBox(height: 16.0),
            _buildInputField('Address Line 1'),
            const SizedBox(height: 16.0),
            _buildInputField('Address Line 2'),
            const SizedBox(height: 24.0),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                enableFeedback: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
              ),
              child: const Text(
                'Update Shipping Address',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }
}
