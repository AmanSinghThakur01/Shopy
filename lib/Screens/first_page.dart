import 'package:flutter/material.dart';
import 'package:pick_and_pay/Screens/Cart_screen.dart';
import 'package:pick_and_pay/Screens/Home_screen.dart';
import 'package:pick_and_pay/Screens/Setting_screen.dart';

class FirstPage extends StatefulWidget {

   FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //selected index for navigation
  int _selectedindex = 0 ;

  //set state to  view the  page we tapped on
  void bottomnavigation( index ){
    setState(() {
      _selectedindex = index ;
    });
  }
  // all pages  list that we have in our App
  final List _pages = [
    HomeScreen(),
    CartScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:  Text("Pick & Pay "),
        actions: [
      IconButton(
      icon: Icon(Icons.search), onPressed: () {
        Navigator.pushNamed(context, '/Searchpage');
      },
      ),
          SizedBox(width: 25,),
          Icon(Icons.inbox),
          SizedBox(width: 25),
          Icon(Icons.notifications),
          SizedBox(width: 25),

        ],
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedindex ,
          onTap: bottomnavigation,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart list'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ]),
    );
  }
}
