import 'package:expense_tracker/screens/analytics.dart';
import 'package:expense_tracker/screens/view_expenses.dart';
import 'package:expense_tracker/styles/global_styles.dart';
import 'package:flutter/material.dart';
import '../screens/view_categories.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List screens = [
    ViewExpenses(),
    ViewCategories(),
    Analytics(),
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
      appBar: AppBar(
        title: Center(
          child: Text(
            'Expense Tracker',
            style: GlobalStyles.heading1.copyWith(color: Colors.white),
          ),
        ),
        elevation: 10,
        backgroundColor: GlobalStyles.themeColor,
      ),
      body: screens[_selectedScreen],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [GlobalStyles.boxShadow]),
        child: BottomNavigationBar(
          onTap: _selectScreen,
          currentIndex: _selectedScreen,
          elevation: 10,
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
          selectedItemColor: GlobalStyles.bottomNavIconColor,
        ),
      ),
    );
  }
}
