import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/viewmodel/user_viewmodel.dart';
import '../auth/login/login_screen.dart';
import '../favorite/product_avaliablity_observer/notification_helper.dart';
import 'components/change_password_screen.dart';
import 'components/faq_screen.dart';
import 'components/manage_notifications_screen.dart';
import 'components/manage_payment_methods_screen.dart';
import 'components/privacy_settings_screen.dart';
import 'components/update_shipping_address_screen.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late UserViewModel userViewModel;

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userViewModel = ref.watch(userViewModelProvider);
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
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
              userViewModel.currentUser.photoLink == ''
                  ? 'https://icons.iconarchive.com/icons/icons8/windows-8/256/Users-Name-icon.png'
                  : userViewModel.currentUser.photoLink,
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userViewModel.currentUser.name,
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(userViewModel.currentUser.email),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: "basic_channel",
                  title: "Merhaba ${userViewModel.currentUser.name}",
                  body:
                      "${userViewModel.currentUser.favList.first.name}  stoklarımıza girmiştir. Stoklar tükenmeden siparişini ver.",
                ),
              );
            },
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
