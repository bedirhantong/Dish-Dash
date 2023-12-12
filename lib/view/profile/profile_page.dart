import 'package:flutter/material.dart';
import '../../core/constants/app/color_strings.dart';
import '../auth/login/login_screen.dart';
import 'components/change_password_screen.dart';
import 'components/faq_screen.dart';
import 'components/manage_notifications_screen.dart';
import 'components/manage_payment_methods_screen.dart';
import 'components/privacy_settings_screen.dart';
import 'components/update_shipping_address_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            userInfo,
            buttonsCard,
          ],
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: AppColor.appBarColor,
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Container get userInfo {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/70720131?v=4'),
          ),
          const SizedBox(width: 16.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bedirhan Tong',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('bedirhantongdev@gmail.com'),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Card get buttonsCard {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildListTile('Change Password', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangePasswordScreen(),
              ),
            );
          }),
          buildListTile('Update Shipping Address', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateShippingAddressScreen(),
              ),
            );
          }),
          buildListTile('Manage Payment Methods', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManagePaymentMethodsScreen(),
              ),
            );
          }),
          buildListTile('Manage Notifications', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManageNotificationsScreen(),
              ),
            );
          }),
          buildListTile('Privacy Settings', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacySettingsScreen(),
              ),
            );
          }),
          buildListTile('FAQ', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FAQScreen(),
              ),
            );
          }),
          buildListTile('Log out', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, Function() onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
