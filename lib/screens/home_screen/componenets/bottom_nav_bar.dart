import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 11,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 26),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'الفئات'),
        BottomNavigationBarItem(icon: Icon(Icons.shop_two_outlined), label: 'المتاجر'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'حسابي'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'عربة التسوق'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
