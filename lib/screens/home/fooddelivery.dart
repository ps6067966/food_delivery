import 'package:flutter/material.dart';
import 'package:food_delivery/screens/bag/bag.dart';

import 'home.dart';

class FoodDelivery extends StatefulWidget {
  FoodDelivery({Key key}) : super(key: key);

  @override
  _FoodDeliveryState createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ///pages
    final _pages = [
      Homescreen(textController: textController),
      BagScreen(),
    ];

    int _currentIndex = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //endDrawer: ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          iconSize: 30,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              label: 'HOME',
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: Colors.amber[200],
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bag',
              icon: Icon(
                Icons.badge,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.badge,
                color: Colors.amber[200],
              ),
            ),
            BottomNavigationBarItem(
              label: 'MENU',
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.amber[200],
              ),
            ),
          ],
        ),
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: _pages[_currentIndex],
      ),
    );
  }
}
