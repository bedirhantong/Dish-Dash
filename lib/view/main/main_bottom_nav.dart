import 'package:flutter/material.dart';
import '../favorite/favorite_page.dart';
import '../home/home.dart';
import '../orders/orders_page.dart';
import '../profile/profile_page.dart';
import 'app_starter.dart';
import 'components/BottomNavigationBar.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({
    super.key,
    this.function,
    required this.initIndex,
  });

  final VoidCallback? function;
  final int initIndex;

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.function?.call();
  }

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home_filled),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodAppHome(),
            ),
            (route) => false,
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomePage(
          initIndex: widget.initIndex,
        );
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
