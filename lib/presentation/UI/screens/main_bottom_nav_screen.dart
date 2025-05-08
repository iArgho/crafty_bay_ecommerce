import 'package:crafty_bay_ecommerce_flutter/presentation/UI/screens/bottomnavscreen/bottom_product_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/bottomnavscreen/bottom_cart_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/bottomnavscreen/bottom_category_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/bottomnavscreen/bottom_home_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const BottomHomeScreen(),
    const BottomCategoryScreen(),
    const BottomCartScreen(),
    BottomProductScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'All Products',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
