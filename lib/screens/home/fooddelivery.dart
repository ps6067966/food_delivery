import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/screens/bag/bag.dart';

import 'home.dart';

class FoodDelivery extends StatefulWidget {
  FoodDelivery({Key key}) : super(key: key);

  @override
  _FoodDeliveryState createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery> {
  int _currentIndex = 0;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _pages = [
      Homescreen(textController: textController),
      BagScreen(),
      Text('Open End Drawer'),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //endDrawer: ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          selectedFontSize: 13,
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
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bag',
              icon: ImageIcon(
                AssetImage("assets/images/bag.png"),
                color: Colors.black,
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/images/bag.png"),
                color: FlutterFlowTheme.primaryColor,
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
                color: FlutterFlowTheme.primaryColor,
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
