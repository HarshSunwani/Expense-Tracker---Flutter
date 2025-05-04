import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final screens = [
    const Text("Expenses"),
    const Text("Categories"),
    const Text("Analytics"),
  ];

  int _selectedScreen = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Expense Tracker'))),
      body: screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
