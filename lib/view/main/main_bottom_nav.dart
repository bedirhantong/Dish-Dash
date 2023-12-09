import 'package:flutter/material.dart';

import '../favorite/favorite_page.dart';
import '../home/home.dart';
import '../orders/orders_page.dart';
import '../profile/profile_page.dart';
import 'components/BottomNavigationBar.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({super.key});

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavBarCustomized(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const FavoritePage();
      case 2:
        return const PastOrdersPage();
      case 3:
        return const ProfilePage();
      default:
        return const SizedBox.shrink();
    }
  }
}
