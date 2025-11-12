import 'package:flutter/material.dart';
import 'package:shopy/presentation/user/screens/CartScreen.dart';
import 'package:shopy/presentation/user/screens/HomeScreen.dart';
import 'package:shopy/presentation/user/screens/SearchScreen.dart';
import 'package:shopy/presentation/user/screens/Setting_Screen.dart';
import 'package:shopy/presentation/user/screens/WishlistScreen.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final List<Widget> _pages = [
    Homescreen(),
    Wishlistscreen(),
    Cartscreen(),
    Searchscreen(),
    SettingScreen(),
  ];

  int _selectedIndex = 0;

  void setIndex(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // Screen width se responsive sizes nikal rahe hain
    double screenWidth = MediaQuery.of(context).size.width;

    double appBarFontSize = screenWidth * 0.06; // AppBar text size
    double appBarIconSize = screenWidth * 0.07; // AppBar icon size
    double horizontalPadding = screenWidth * 0.03; // padding
    double bottomNavIconSize = screenWidth * 0.07; // BottomNavigationBar icon
    double bottomNavFontSize = screenWidth * 0.04; // BottomNavigationBar text

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: setIndex,
        iconSize: bottomNavIconSize,
        selectedFontSize: bottomNavFontSize,
        unselectedFontSize: bottomNavFontSize,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
