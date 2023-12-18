import 'dart:async';

import 'package:dish_dash/core/constants/app/color_strings.dart';
import 'package:dish_dash/core/model/service_model/order/order_model.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/model/service_model/product/product_model.dart';
import '../main/main_bottom_nav.dart';
import 'components/address_card.dart';
import 'components/credit_card_input_form.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Kredi/Banka Kartı';

  DeliveryMethod _selectedDeliveryMethod = DeliveryMethod.courier;

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
              const SecondaryStepper(),
              const SizedBox(height: 16),
              const AddressCard(),
              const SizedBox(height: 16),
              _buildDeliveryMethodOptions(),
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

  Widget _buildDeliveryMethodOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Teslimat Yöntemi:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _buildDeliveryRadio(DeliveryMethod.courier, 'Kurye'),
                const SizedBox(width: 16),
                _buildDeliveryRadio(
                    DeliveryMethod.storePickup, 'Mağazadan Teslim'),
              ],
            ),
            _buildDeliveryRadio(
                DeliveryMethod.selfPickup, 'Kendi Kendine Alma'),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryRadio(DeliveryMethod value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedDeliveryMethod,
          onChanged: (selectedValue) {
            setState(() {
              _selectedDeliveryMethod = selectedValue!;
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
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
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const PaymentConfirmationDialog(
            totalAmount: 100.0,
          ),
        );
      },
      style: ElevatedButton.styleFrom(),
      child: Text(
        'Ödemeyi Onayla (\$${214.toStringAsFixed(2)})',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SecondaryStepper extends StatelessWidget {
  const SecondaryStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.shopping_cart_outlined, color: AppColor.appBarColor),
        SizedBox(width: 1),
        Text('Cart'),
        SizedBox(width: 1),
        Icon(Icons.keyboard_arrow_right, size: 18, color: Colors.grey),
        SizedBox(width: 1),
        Icon(Icons.payment_outlined, color: Colors.cyanAccent),
        Text('Edit Delivery'),
        SizedBox(width: 1),
        Icon(Icons.keyboard_arrow_right, size: 18, color: Colors.grey),
        SizedBox(width: 1),
        Icon(Icons.check_circle_outline_rounded, color: Colors.cyanAccent),
        Text('Payment'),
      ],
    );
  }
}

enum DeliveryMethod {
  courier, // Kurye ile teslimat
  storePickup, // Mağazadan teslim alma
  selfPickup, // seçtiğin yerden kendin kendine alma
}

class PaymentConfirmationDialog extends StatefulWidget {
  final double totalAmount;

  const PaymentConfirmationDialog({super.key, required this.totalAmount});

  @override
  _PaymentConfirmationDialogState createState() =>
      _PaymentConfirmationDialogState();
}

class _PaymentConfirmationDialogState extends State<PaymentConfirmationDialog> {
  late Timer _timer;
  int _remainingTime = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/images/bank_logos/garanti.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const Text(
                'Garanti Bankası',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '\$${UserViewModel.priceOfCart().toStringAsFixed(2)} Ödemeyi Onayla',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ödemenizi onaylamak için Garanti Bankası uygulamasından işlem yapınız.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              _remainingTime <= 0
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Tekrar Dene',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        LinearProgressIndicator(
                          value: _remainingTime / 120,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Ödemenizi onaylamak için $_remainingTime saniyeniz kaldı.',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            OrderModel order = OrderModel(
                                orderNumber: UserViewModel.orderNumGenerate(),
                                orderDate: DateTime.now(),
                                orderStatus: "on",
                                orderProducts: UserViewModel.cartProducts,
                                totalAmount: UserViewModel.priceOfCart());
                            UserViewModel.currentUser.orderList.add(order);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavMain(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Sonlandır',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        )
      ],
    );
  }
}
