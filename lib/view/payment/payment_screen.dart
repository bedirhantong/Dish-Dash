import 'package:dish_dash/core/constants/app/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/model/product/product_model.dart';
import 'components/address_card.dart';
import 'components/credit_card_input_form.dart';

class PaymentScreen extends StatefulWidget {
  final List<Product> cartProducts;
  final double totalAmount;

  const PaymentScreen({
    Key? key,
    required this.cartProducts,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Kredi/Banka Kartı';

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
          'Ödeme',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Teslimat Bilgileri'),
              const SizedBox(height: 16),
              const AddressCard(),
              const SizedBox(height: 16),
              _buildSectionTitle('Ödeme Yöntemi'),
              const SizedBox(height: 8),
              _buildPaymentMethodOptions(),
              const SizedBox(height: 16),
              if (_selectedPaymentMethod == 'Kredi/Banka Kartı')
                const CreditCardInputForm(),
              const SizedBox(height: 16),
              _buildPaymentButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildPaymentMethodOptions() {
    return Row(
      children: [
        _buildPaymentRadio('Kredi/Banka Kartı'),
        const SizedBox(width: 16),
        _buildPaymentRadio('Kapıda Ödeme'),
      ],
    );
  }

  Widget _buildPaymentRadio(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedPaymentMethod,
          onChanged: (selectedValue) {
            setState(() {
              _selectedPaymentMethod = selectedValue as String;
            });
          },
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentButton() {
    return OutlinedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(),
      child: Text(
        'Ödemeyi Onayla (\$${widget.totalAmount.toStringAsFixed(2)})',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
