import 'package:flutter/material.dart';

import '../../core/constants/app/color_strings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
                'Bedirhan',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('user@bdo.com'),
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
          ListTile(
            title: const Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Update Shipping Address'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Manage Payment Methods'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Manage Notifications'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Privacy Settings'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('FAQ'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Log out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
