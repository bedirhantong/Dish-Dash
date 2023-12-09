import 'package:flutter/material.dart';

class BottomNavBarCustomized extends StatefulWidget {
  const BottomNavBarCustomized({
    Key? key,
    required this.currentIndex,
    required this.onIndexChanged,
  }) : super(key: key);

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
      indicatorColor: Colors.deepPurple,
      selectedIndex: widget.currentIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          icon: Badge(
            child: Icon(Icons.favorite_border),
          ),
          label: 'Favorite',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.local_shipping_sharp,
            color: Colors.white,
          ),
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.local_shipping_outlined),
          ),
          label: 'Orders',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.person_outline_sharp),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
