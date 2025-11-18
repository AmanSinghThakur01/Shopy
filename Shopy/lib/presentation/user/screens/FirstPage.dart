import 'package:flutter/material.dart';
import 'package:shopy/presentation/user/screens/CartScreen.dart';
import 'package:shopy/presentation/user/screens/HomeScreen.dart';
import 'package:shopy/presentation/user/screens/Setting_Screen.dart';
import 'package:shopy/presentation/user/screens/WishlistScreen.dart';

class Firstpage extends StatefulWidget {
  final int index;

  const Firstpage({super.key, this.index = 0});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  final List<Widget> _pages = const [
    Homescreen(),
    Wishlistscreen(),
    Cartscreen(),
    SettingScreen(),
  ];

  void setIndex(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final padding = width * 0.03;
    final iconSize = width * 0.065;
    final labelSize = width * 0.035;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: setIndex,

        iconSize: iconSize,
        selectedFontSize: labelSize,
        unselectedFontSize: labelSize,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
