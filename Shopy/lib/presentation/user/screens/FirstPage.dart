import 'package:flutter/material.dart';
import 'package:shopy/core/app_constants.dart';
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
  List _pages = [
    Homescreen(),
   Wishlistscreen(),
    Cartscreen(),
    Searchscreen(),
    SettingScreen(),

  ];
  int _selectedIndex = 0 ;
  void setIndex ( int index){
    setState(() {
      _selectedIndex = index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Shopy",
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [Icon(Icons.person)],
    ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.tealAccent,
          selectedItemColor: AppColors.secondary,
          currentIndex: _selectedIndex,
          onTap: setIndex,
          items:[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ' Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ' Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ' Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ' Search'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ' Settings'),
      ]),
    );
  }
}
