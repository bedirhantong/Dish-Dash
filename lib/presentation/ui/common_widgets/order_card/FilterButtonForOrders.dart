import 'package:flutter/material.dart';

class FilterButtonForOrders extends StatefulWidget {
  const FilterButtonForOrders({super.key});

  @override
  State<FilterButtonForOrders> createState() => _FilterButtonForOrdersState();
}

class _FilterButtonForOrdersState extends State<FilterButtonForOrders> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
      onSelected: (String result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'dateAsc',
          child: ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tarihe Göre Artan'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'dateDesc',
          child: ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tarihe Göre Azalan'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'priceAsc',
          child: ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Fiyata Göre Artan'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'priceDesc',
          child: ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Fiyata Göre Azalan'),
          ),
        ),
      ],
    );
  }
}
