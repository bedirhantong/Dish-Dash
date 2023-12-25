import 'package:flutter/material.dart';

class BottomNavBarCustomized extends StatefulWidget {
  const BottomNavBarCustomized({
    Key? key,
    required this.currentIndex,
    required this.onIndexChanged,
    required this.initIndex,
  }) : super(key: key);
  final int initIndex;
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  State<BottomNavBarCustomized> createState() => _BottomNavBarCustomizedState();
}

class _BottomNavBarCustomizedState extends State<BottomNavBarCustomized> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        widget.onIndexChanged(index);
      },
      indicatorColor: Colors.transparent, // Set indicator color to transparent
      selectedIndex: widget.currentIndex,
      destinations: List.generate(
        4,
        (index) => _buildNavigationDestination(
          index,
          index == widget.currentIndex,
        ),
      ),
    );
  }

  Widget _buildNavigationDestination(int index, bool isSelected) {
    return NavigationDestination(
      selectedIcon: Icon(
        _getIconData(index),
        color: Colors.deepPurple,
      ),
      icon: Icon(
        _getIconData(index),
      ),
      label: _getLabel(index),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.favorite_border;
      case 2:
        return Icons.local_shipping_outlined;
      case 3:
        return Icons.person_outline_sharp;
      default:
        return Icons.home_outlined;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Favorite';
      case 2:
        return 'Orders';
      case 3:
        return 'Profile';
      default:
        return 'Home';
    }
  }
}
